package com.example.students.PathController;

import com.example.students.PathModel.PathModel;
import com.example.students.PathRepository.repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
public class PathController {

    @Autowired
    private repository repo;

    // ====== Login Pages ======
    @GetMapping("/login")
    public String loginPage() {
        return "Login";
    }

    @GetMapping("/adminlogin")
    public String showAdminLogin() {
        return "adminlogin";
    }

    @PostMapping("/adminlogin")
    public String doAdminLogin(@RequestParam String username,
                               @RequestParam String password,
                               Model model) {
        if ("admin".equals(username) && "1234".equals(password)) {
            return "Index";
        } else {
            model.addAttribute("error", "Invalid admin credentials");
            return "adminlogin";
        }
    }

    @GetMapping("/studentlogin")
    public String showStudentLogin() {
        return "studentlogin";
    }

    @PostMapping("/studentlogin")
    public String doStudentLogin(@RequestParam String rollnumber,
                                 @RequestParam String password,
                                 Model model) {
        if (!rollnumber.isEmpty() && !password.isEmpty()) {

            // Fixed password check
            if (password.equals("GCE@123")) {
                List<PathModel> students = repo.findAll(); // Optional: filter this by rollnumber if needed
                model.addAttribute("students", students);
                return "selectyear";
            } else {
                model.addAttribute("error", "Invalid password");
                return "studentlogin";
            }

        } else {
            model.addAttribute("error", "Please fill in all fields");
            return "studentlogin";
        }
    }

    

    // ====== Student CRUD ======

    @GetMapping("/home")
    public String showAdminHome() {
        return "Home";
    }

    @GetMapping("/addstudent")
    public String showAddStudentForm(Model model) {
        model.addAttribute("student", new PathModel());
        return "Index";
    }

    @PostMapping("/add")
    public String addStudent(@ModelAttribute PathModel student, Model model) {
        try {
            String calculatedYear = getCurrentYearFromRoll(student.getRollNumber());
            student.setYear(calculatedYear);
            repo.save(student);
            return "Index";
        } catch (Exception e) {
            model.addAttribute("error", "Roll Number or Email already exists!");
            return "Index";
        }
    }

    @GetMapping("/view")
    public String showStudentList(Model model) {
        List<PathModel> students = repo.findAll();
        model.addAttribute("students", students);
        return "View";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        PathModel student = repo.findById(id).orElse(null);
        if (student == null) {
            model.addAttribute("error", "Student not found with ID: " + id);
            return "error";
        }
        model.addAttribute("student", student);
        return "edit";
    }

    @PostMapping("/updatestudent")
    public String updateStudent(@ModelAttribute PathModel student, Model model) {
        if (student.getId() == null || !repo.existsById(student.getId())) {
            model.addAttribute("error", "Cannot update. Student not found.");
            return "error";
        }

        String updatedYear = getCurrentYearFromRoll(student.getRollNumber());
        student.setYear(updatedYear);
        repo.save(student);
        return "redirect:/selectyear";
    }

    @GetMapping("/deletestudent/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        repo.deleteById(id);
        return "redirect:/view";
    }

    // ====== Filter by Academic Year (Generic) ======

    @GetMapping("/filter-by-year")
    public String filterByYear(@RequestParam("year") String year, Model model) {
        List<PathModel> filtered = repo.findByYear(year);
        model.addAttribute("students", filtered);
        return "View";
    }

    // ====== Year-specific Endpoints ======

    @GetMapping("/year/1")
    public String getFirstYearStudents(Model model) {
        List<PathModel> students = repo.findByYear("1st Year");
        model.addAttribute("students", students);
        return "year1";
    }

    @GetMapping("/year/2")
    public String getSecondYearStudents(Model model) {
        List<PathModel> students = repo.findByYear("2nd Year");
        model.addAttribute("students", students);
        return "year2";
    }

    @GetMapping("/year/3")
    public String getThirdYearStudents(Model model) {
        List<PathModel> students = repo.findByYear("3rd Year");
        model.addAttribute("students", students);
        return "year3";
    }

    @GetMapping("/year/4")
    public String getFourthYearStudents(Model model) {
        List<PathModel> students = repo.findByYear("4th Year");
        model.addAttribute("students", students);
        return "year4";
    }
    
    @GetMapping("/selectyear")
    public String showYearSelection() {
        return "selectyear"; // JSP file name
    }

    // ====== Subject Redirections ======

    @GetMapping("/redirect-to-subjects")
    public String redirectToSubjects(@RequestParam("rollnumber") String rollNumber, Model model) {
        PathModel student = repo.findByRollNumber(rollNumber);
        if (student != null) {
            return "redirect:/student/" + student.getId() + "/subjects";
        } else {
            model.addAttribute("error", "Student with Roll Number " + rollNumber + " not found.");
            return "errorpage";
        }
    }

    @GetMapping("/redirect-to-addsubject")
    public String redirectToAddSubject(@RequestParam("rollnumber") String rollNumber, Model model) {
        PathModel student = repo.findByRollNumber(rollNumber);
        if (student != null) {
            return "redirect:/student/" + student.getId() + "/addsubject";
        } else {
            model.addAttribute("error", "Student with Roll Number " + rollNumber + " not found.");
            return "errorpage";
        }
    }

    // ====== Utility Method ======

    private String getCurrentYearFromRoll(String rollNumber) {
        if (rollNumber == null || rollNumber.length() < 2) return "Invalid";
        try {
            String yearPrefix = rollNumber.substring(0, 2); // e.g., "22"
            int joinYear = Integer.parseInt("20" + yearPrefix);
            int currentYear = LocalDate.now().getYear();
            int diff = currentYear - joinYear + 1;

            switch (diff) {
                case 1: return "1st Year";
                case 2: return "2nd Year";
                case 3: return "3rd Year";
                case 4: return "4th Year";
                default: return "Graduated or Invalid";
            }
        } catch (Exception e) {
            return "Invalid";
        }
    }
}
