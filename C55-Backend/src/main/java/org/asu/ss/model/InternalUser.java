package org.asu.ss.model;

import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "i_users")
public class InternalUser {
	
	@Id
	@Column(name = "e_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long e_id;

	@Column(name="password")
	private String password;
	
	@Column(name="f_name")
	private String f_name;
	
	@Column(name="l_name")
	private String l_name;
	
	@Column(name="email")
	private String email;
	
	@Column(name="access_level")
	private String access_level;
	
	@Column(name="trusted_devices")
	private String trusted_devices;
	
	@Column(name="mobile")
	private long mobile;
	
	@Column(name="last_login_time")
	private Time last_login_time;
	
	public long getE_id() {
		return e_id;
	}

	public void setE_id(long e_id) {
		this.e_id = e_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccess_level() {
		return access_level;
	}

	public void setAccess_level(String access_level) {
		this.access_level = access_level;
	}

	public String getTrusted_devices() {
		return trusted_devices;
	}

	public void setTrusted_devices(String trusted_devices) {
		this.trusted_devices = trusted_devices;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile_no) {
		this.mobile = mobile_no;
	}

	public Time getLast_login_time() {
		return last_login_time;
	}

	public void setLast_login_time(Time last_login_time) {
		this.last_login_time = last_login_time;
	}

	public InternalUser() {
		super();
	}

	public InternalUser(long e_id, String password, String f_name, String l_name, String email, String access_level,
			String trusted_devices, long mobile_no, Time last_login_time) {
		super();
		this.e_id = e_id;
		this.password = password;
		this.f_name = f_name;
		this.l_name = l_name;
		this.email = email;
		this.access_level = access_level;
		this.trusted_devices = trusted_devices;
		this.mobile = mobile_no;
		this.last_login_time = last_login_time;
	}

	@Override
	public String toString() {
		return "InternalUser [e_id=" + e_id + ", password=" + password + ", f_name=" + f_name + ", l_name=" + l_name
				+ ", email=" + email + ", access_level=" + access_level + ", trusted_devices=" + trusted_devices
				+ ", mobile=" + mobile + ", last_login_time=" + last_login_time + "]";
	}

	
}
