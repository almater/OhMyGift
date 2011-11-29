package ohmygift.rollingpaper.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ohmygift.common.Action;
import ohmygift.common.ActionForward;

/**
 * Servlet implementation class RollingPaperController
 */
public class RollingPaperController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request,HttpServletResponse response) 
    		throws ServletException,IOException{
    	System.out.println("RollingPaperController");
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	ActionForward forward = null;
    	Action action = null;
    	System.out.println(command);		
		
    	if(command.equals("/ohmygift/makerolling.roll")){
    		System.out.println("makerolling");
    		action = new MakeRollingPaperAction();
    		try{
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				// TODO: handle exception
    			e.printStackTrace();
			}
    	}
    	else if(command.equals("/makerolling.roll")){
    		System.out.println("makerolling");
    		action = new MakeRollingPaperAction();
    		try{
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				// TODO: handle exception
    			e.printStackTrace();
			}
    	}
    	else if(command.equals("/ohmygift/getrolling.roll")){
    		System.out.println("getrolling");
    		action = new GetRollingPaperAction();
    		try{
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				// TODO: handle exception
    			e.printStackTrace();
			}
    	}
    	else if(command.equals("/getrolling.roll")){
    		System.out.println("getrolling");
    		action = new GetRollingPaperAction();
    		try{
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				// TODO: handle exception
    			e.printStackTrace();
			}
    	}
    	
    	if(forward.isredirect()){
    		response.sendRedirect(forward.getPath());
    	}else{
    		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    		dispatcher.forward(request, response);
    	}
    }   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RollingPaperController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
