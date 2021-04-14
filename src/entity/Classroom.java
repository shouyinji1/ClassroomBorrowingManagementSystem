package entity;

import java.io.Serializable;
import org.springframework.stereotype.Component;

/** 教室信息 */
@Component("classroom")
public class Classroom implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String type;
	private String xiaoQu;
	private String jiaoXueQu;
	private String jiaoXueLou;
	private String floor;
	private String capacity;
	
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
	public String getJiaoXueQu() {
		return jiaoXueQu;
	}
	public void setJiaoXueQu(String jiaoXueQu) {
		this.jiaoXueQu = jiaoXueQu;
	}
	public String getJiaoXueLou() {
		return jiaoXueLou;
	}
	public void setJiaoXueLou(String jiaoXueLou) {
		this.jiaoXueLou = jiaoXueLou;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
}
