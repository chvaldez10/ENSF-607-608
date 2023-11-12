package com.in28minutes.springboot.learnspringboot;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {
	public List<Course> retreiveAllCourses() {
		return Arrays.asList(
				new Course(1, "Learn AWS", "in28min"),
				new Course(1, "Learn DevOps", "in28min")
				);
	}
}
