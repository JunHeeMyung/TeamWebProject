package com.zumuniyo.orderlist;

import java.io.IOException;
import java.util.*;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {

	// 세션과 매장번호를 매칭
	static Map<Session, Integer> accessor = Collections.synchronizedMap(new HashMap<Session, Integer>());
	
	@OnOpen
	public void handleOpen(Session userSession) {
		accessor.put(userSession, -1);
	}
	
	// 매장주문이 오면 해당 매장직원의 관리시스템으로 새로고침 신호보냄
	static public void orderReflesh(int shop_seq) {
		
		for(Session session:accessor.keySet()) {
			if(accessor.get(session)==shop_seq) {
				try {
					session.getBasicRemote().sendText(shop_seq+"");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	// 매장 관리 시스템 접속 알림
	@OnMessage
	public void handleMessage(String message,Session userSession) {
		System.out.println("[접속]: "+":"+ message+"번 매장("+userSession.getId()+")");
		accessor.put(userSession, Integer.parseInt(message));
	}

	// 매장 관리 시스템 접속 해제 알림
	@OnClose
	static public void handleClose(Session userSession) {
		System.out.println("[접속해제]: "+":"+ accessor.get(userSession)+"번 매장("+userSession.getId()+")");
		accessor.remove(userSession);
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

}
