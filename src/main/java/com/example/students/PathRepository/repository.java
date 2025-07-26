package com.example.students.PathRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.students.PathModel.PathModel;

@Repository
public interface repository extends JpaRepository<PathModel, Long> {

    // Find by roll number (for uniqueness check or fetching student)
    PathModel findByRollNumber(String rollNumber);

    // Find by email (to check if already registered)
    PathModel findByEmail(String email);

    // Login validation
    PathModel findByRollNumberAndPassword(String rollNumber, String password);

    // ✅ Return a list of students in the given academic year
    List<PathModel> findByYear(String year);
}
