package entity;

import java.io.Serializable;

/** 教室信息 */
public class Classroom implements Serializable{
	private String id;
	private String name;
	private String type;
	private String xiaoQu;
	private String jiaoXueLou;
	private int capacity;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getXiaoQu() {
		return xiaoQu;
	}
	public void setXiaoQu(String xiaoQu) {
		this.xiaoQu = xiaoQu;
	}
	public String getJiaoXueLou() {
		return jiaoXueLou;
	}
	public void setJiaoXueLou(String jiaoXueLou) {
		this.jiaoXueLou = jiaoXueLou;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
