package conn;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatServer")
public class ChatServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        String sessionId = session.getId();
        session.getUserProperties().put("ID", sessionId);
        System.out.println(sessionId + " ¥‘¿Ã ¿‘¿Â«œºÃΩ¿¥œ¥Ÿ.");
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String sessionId = session.getUserProperties().get("ID").toString();
        System.out.println(sessionId + " : " + message);

        synchronized (clients) {
            for (Session client : clients) {
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(sessionId + ": " + message);
                }
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        String sessionId = session.getUserProperties().get("ID").toString();
        clients.remove(session);
        System.out.println(sessionId + " ¥‘¿Ã ≈¿Â«œºÃΩ¿¥œ¥Ÿ.");
    }

    @OnError
    public void onError(Throwable e) {
        e.printStackTrace();
    }
}