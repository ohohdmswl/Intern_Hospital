package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
//import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Controller
@RequestMapping(value ="/dash")
public class DashController {
//	private static Logger Logger = LoggerFactory.getLogger(DashBoardController2.class);
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
	
	
//	@Resource(name="BoardService")
//	private BoardService boardService;
	
	
	@RequestMapping(value="/dashboardList.do")
	public String helloworld() throws Exception {
		
		logger.info("대시보드컨트롤러 " + className + "helloworld()");
		
		System.out.println("하하하");

		return "dashboard/dashboardList";
	}
	
}