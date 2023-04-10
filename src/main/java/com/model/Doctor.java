package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "doctor")
public class Doctor {
	@Id
	@Column(name = "id")
	int id;
	@Column(name = "doctorName")
	String doctorName;
	@Column(name = "doctorType")
	String doctorType;
	@Column(name = "doctorLocation")
	String doctorLocation;
	@Column(name = "doctorRate")
	double doctorRate;
	@OneToMany(mappedBy = "doctor")
	private List<Booking> bookings;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctorType() {
		return doctorType;
	}

	public void setDoctorType(String doctorType) {
		this.doctorType = doctorType;
	}

	public String getDoctorLocation() {
		return doctorLocation;
	}

	public void setDoctorLocation(String doctorLocation) {
		this.doctorLocation = doctorLocation;
	}

	public double getDoctorRate() {
		return doctorRate;
	}

	public void setDoctorRate(double doctorRate) {
		this.doctorRate = doctorRate;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

}
