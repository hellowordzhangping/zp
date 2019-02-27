package big.java.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;


public class BaiduAction extends ActionSupport{ 
	private  List<Object> usernameList  =new ArrayList<Object>();
	
	
	public List<Object> getUsernameList() {
		return usernameList;
	}
	public void setUsernameList(List<Object> usernameList) {
		this.usernameList = usernameList;
	}
	
	public String execute() {
		usernameList.add("zxczv");
		usernameList.add("zxcxzv");
		usernameList.add("zxcxzvzv");
		usernameList.add("zxcxzv");
		usernameList.add("zxcxzvxz");
		return "success";
	}
	
	
}