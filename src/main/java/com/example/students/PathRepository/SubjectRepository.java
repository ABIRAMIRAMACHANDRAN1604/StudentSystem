package com.example.students.PathRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.students.PathModel.SubjectModel;

@Repository
public interface SubjectRepository extends JpaRepository<SubjectModel, Long> {
    
    // Custom query method to find subjects by student ID
    List<SubjectModel> findByStudentId(Long studentId);
    
    List<SubjectModel> findByStudent_Year(String year);

}
