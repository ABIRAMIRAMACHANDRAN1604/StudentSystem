package com.example.students.PathModel;

import jakarta.persistence.*;

@Entity
@Table(name = "subjects")
public class SubjectModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String subjectName;
    private String grade;
    private int year; // 1, 2, 3, 4

    @ManyToOne
    @JoinColumn(name = "rollnumber", referencedColumnName = "rollnumber")
    private PathModel student;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public PathModel getStudent() {
        return student;
    }

    public void setStudent(PathModel student) {
        this.student = student;
    }
}
