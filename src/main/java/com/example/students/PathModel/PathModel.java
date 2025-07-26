package com.example.students.PathModel;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "student")
public class PathModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(unique = true)
    private String rollNumber;

    private String department;

    private String email;

    private String contactNumber;

    private String password;

    private double cgpa;

    private String interestedRole;

    // ✅ NEW: Store year like "1st Year", "2nd Year"
    private String year;

    // ✅ One student can have many subjects
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SubjectModel> subjects;

    // === Constructors ===
    public PathModel() {}

    public PathModel(String name, String rollNumber, String department, String email,
                     String contactNumber, String password, double cgpa, String interestedRole, String year) {
        this.name = name;
        this.rollNumber = rollNumber;
        this.department = department;
        this.email = email;
        this.contactNumber = contactNumber;
        this.password = password;
        this.cgpa = cgpa;
        this.interestedRole = interestedRole;
        this.year = year;
    }

    // === Getters and Setters ===
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }

    public String getInterestedRole() {
        return interestedRole;
    }

    public void setInterestedRole(String interestedRole) {
        this.interestedRole = interestedRole;
    }

    public List<SubjectModel> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<SubjectModel> subjects) {
        this.subjects = subjects;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
