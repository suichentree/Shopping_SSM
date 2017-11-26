package com.entity;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;


public class User {
	private Integer id; //id 自动增长
	@NotBlank(message="用户名不能为空")
	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",message="用户名必须是2-5位中文或6-16为英文与数字的组合")
	private String username;                //username，password必填
	@NotBlank(message="密码不能为空")
	@Length(min=6,max=12,message="密码必须在6-12 位之间")
	private String password;
	
	@NotBlank(message="电话不能为空")
	@Pattern(regexp="[1][3,8][3,6,9][0-9]{8}",message="无效的电话号码")
	private String phone;
	private String address;              //用户地址
	
	private String realname;
	private Integer age;
	private String gender;               //用户性别
	private Integer status;
	
	public User() {}

	
	
	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}



	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", address=" + address + ", realname=" + realname + ", age=" + age + ", gender=" + gender
				+ ", status=" + status + "]";
	}


	

	
	
	
}
