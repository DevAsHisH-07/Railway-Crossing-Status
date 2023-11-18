package com.railway.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RailwayCrossing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String address;
    private String landmark;
    private String trainSchedules;
    private String personInCharge;
    private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getTrainSchedules() {
		return trainSchedules;
	}
	public void setTrainSchedules(String trainSchedules) {
		this.trainSchedules = trainSchedules;
	}
	public String getPersonInCharge() {
		return personInCharge;
	}
	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

    // Getters and setters
}

