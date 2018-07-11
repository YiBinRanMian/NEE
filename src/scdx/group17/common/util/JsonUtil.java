package scdx.group17.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JsonUtil {

	private static Logger log = Logger.getLogger(JsonUtil.class);

	public static void printByJSON(HttpServletResponse response, Object obj) {
		String jsonStr = "";
		if (obj != null && !"".equals(obj)) {
			jsonStr = JSON.toJSONString(obj);
		}
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json;charset=UTF-8");
			out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			log.debug("返回结果:" + jsonStr);
		} catch (IOException e) {
			log.error("response 输出json异常!" + e);
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}


	public static void printByJSONArray(HttpServletResponse response, Object obj) {
		String jsonStr = "";
		if (obj != null && !"".equals(obj)) {
			jsonStr =JSONArray.toJSONString(obj);
		}
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json;charset=UTF-8");
			out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			log.debug("返回结果:" + jsonStr);
		} catch (IOException e) {
			log.error("responce 输出json异常!" + e);
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}
