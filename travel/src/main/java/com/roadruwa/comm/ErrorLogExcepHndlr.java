package com.roadruwa.comm;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;


/**  
 * @Class Name : ErrorLogExcepHndlr.java
 * @Description : ErrorLogExcepHndlr Class
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2017.01.19           최초생성
 * 
 * @author ITOMS 개발
 * @since 2017.01.19
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by ITOMS All right reserved.
 */
public class ErrorLogExcepHndlr implements ExceptionHandler {
	protected Log log = LogFactory.getLog(this.getClass());
    
    /**
    * @param exception
    * @param packageName
    * @see ITOMS 개발팀
    */
    public void occur(Exception exception, String packageName) {
		log.debug(" ErrorLogExcepHndlr run...............");

		try {
			log.debug(" ErrorLogExcepHndlr try ");
			System.out.println(" ErrorLogExcepHndlr try ");
		} catch (Exception e) {
			e.printStackTrace();
		}

    }

}
