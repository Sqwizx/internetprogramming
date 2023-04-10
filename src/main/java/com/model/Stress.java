package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "stress")
public class Stress {
	@Id
	@Column(name = "gender")
	String gender;
	@Column(name = "age")
	String age;
	@Column(name = "healthConditions")
	String[] healthConditions;
	@Column(name = "stressLevel")
	int stressLevel;
	@Column(name = "stressLevelResult")
	String stressLevelResult;
	@Column(name = "stressLevelAnalysis")
	String stressLevelAnalysis;
	@Column(name = "upsetFrequency1")
	String upsetFrequency1;
	@Column(name = "upsetFrequency2")
	String upsetFrequency2;
	@Column(name = "upsetFrequency3")
	String upsetFrequency3;
	@Column(name = "upsetFrequency4")
	String upsetFrequency4;
	@Column(name = "upsetFrequency5")
	String upsetFrequency5;
	@Column(name = "upsetFrequency6")
	String upsetFrequency6;
	@Column(name = "upsetFrequency7")
	String upsetFrequency7;
	@Column(name = "upsetFrequency8")
	String upsetFrequency8;

	public String getUpsetFrequency1() {
		return upsetFrequency1;
	}

	public void setUpsetFrequency1(String upsetFrequency1) {
		this.upsetFrequency1 = upsetFrequency1;
	}

	public String getUpsetFrequency2() {
		return upsetFrequency2;
	}

	public void setUpsetFrequency2(String upsetFrequency2) {
		this.upsetFrequency2 = upsetFrequency2;
	}

	public String getUpsetFrequency3() {
		return upsetFrequency3;
	}

	public void setUpsetFrequency3(String upsetFrequency3) {
		this.upsetFrequency3 = upsetFrequency3;
	}

	public String getUpsetFrequency4() {
		return upsetFrequency4;
	}

	public void setUpsetFrequency4(String upsetFrequency4) {
		this.upsetFrequency4 = upsetFrequency4;
	}

	public String getUpsetFrequency5() {
		return upsetFrequency5;
	}

	public void setUpsetFrequency5(String upsetFrequency5) {
		this.upsetFrequency5 = upsetFrequency5;
	}

	public int getStressLevel() {
		return stressLevel;
	}

	public void setStressLevel(int stressLevel) {
		this.stressLevel = stressLevel;
	}

	public String getStressLevelAnalysis() {
		return stressLevelAnalysis;
	}

	public void setStressLevelAnalysis(String stressLevelAnalysis) {
		this.stressLevelAnalysis = stressLevelAnalysis;
	}

	public String getUpsetFrequency6() {
		return upsetFrequency6;
	}

	public void setUpsetFrequency6(String upsetFrequency6) {
		this.upsetFrequency6 = upsetFrequency6;
	}

	public String getUpsetFrequency7() {
		return upsetFrequency7;
	}

	public void setUpsetFrequency7(String upsetFrequency7) {
		this.upsetFrequency7 = upsetFrequency7;
	}

	public String getUpsetFrequency8() {
		return upsetFrequency8;
	}

	public void setUpsetFrequency8(String upsetFrequency8) {
		this.upsetFrequency8 = upsetFrequency8;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String[] getHealthConditions() {
		return healthConditions;
	}

	public void setHealthConditions(String[] healthConditions) {
		this.healthConditions = healthConditions;
	}

	public String getStressLevelResult() {
		return stressLevelResult;
	}

	public void setStressLevelResult(String stressLevelResult) {
		this.stressLevelResult = stressLevelResult;
	}

}
