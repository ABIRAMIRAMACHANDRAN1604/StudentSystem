package com.example.students.PathController;

import com.example.students.PathModel.PathModel;
import com.example.students.PathModel.SubjectModel;
import com.example.students.PathRepository.SubjectRepository;
import com.example.students.PathRepository.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SubjectController {

    @Autowired
    private SubjectRepository subjectRepo;

    @Autowired
    private repository repo;

    @GetMapping("/student/{id}/subjects")
    public String viewSubjects(@PathVariable Long id, Model model) {
        PathModel student = repo.findById(id).orElse(null);
        if (student == null) {
            model.addAttribute("error", "Student not found.");
            return "error";
        }
        List<SubjectModel> subjects = subjectRepo.findByStudentId(id);
        model.addAttribute("subjects", subjects);
        model.addAttribute("studentId", id);
        model.addAttribute("rollNumber", student.getRollNumber());
        return "subjectlist";
    }

    @GetMapping("/student/{id}/addsubject")
    public String showAddSubjectForm(@PathVariable Long id, Model model) {
        PathModel student = repo.findById(id).orElse(null);
        if (student == null) {
            model.addAttribute("error", "Student not found.");
            return "error";
        }
        SubjectModel subject = new SubjectModel();
        subject.setStudent(student);
        model.addAttribute("subject", subject);
        return "addsubject";
    }

    @PostMapping("/student/{id}/addsubject")
    public String addSubject(@PathVariable Long id, @ModelAttribute SubjectModel subject) {
        PathModel student = repo.findById(id).orElse(null);
        if (student != null) {
            subject.setId(null);
            subject.setStudent(student);
            subjectRepo.save(subject);
        }
        return "redirect:/student/" + id + "/subjects";
    }

    @GetMapping("/subject/delete/{subjectId}")
    public String deleteSubject(@PathVariable Long subjectId) {
        SubjectModel subject = subjectRepo.findById(subjectId).orElse(null);
        if (subject != null) {
            Long studentId = subject.getStudent().getId();
            subjectRepo.deleteById(subjectId);
            return "redirect:/student/" + studentId + "/subjects";
        }
        return "error";
    }

    @GetMapping("/subject/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        SubjectModel subject = subjectRepo.findById(id).orElse(null);
        if (subject == null) {
            model.addAttribute("error", "Subject not found.");
            return "error";
        }
        model.addAttribute("subject", subject);
        return "editsubject";
    }

    @PostMapping("/subject/update/{id}")
    public String updateSubject(@PathVariable Long id, @ModelAttribute SubjectModel updatedSubject) {
        SubjectModel subject = subjectRepo.findById(id).orElse(null);
        if (subject != null) {
            subject.setSubjectName(updatedSubject.getSubjectName());
            subject.setGrade(updatedSubject.getGrade());
            subjectRepo.save(subject);
            return "redirect:/student/" + subject.getStudent().getId() + "/subjects";
        }
        return "error";
    }
}
