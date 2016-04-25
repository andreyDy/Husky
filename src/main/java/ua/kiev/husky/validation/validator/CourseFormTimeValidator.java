package ua.kiev.husky.validation.validator;

import org.joda.time.LocalDate;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.validation.CourseForm;


public class CourseFormTimeValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Course.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        CourseForm form = (CourseForm) target;
        LocalDate today = new LocalDate(System.currentTimeMillis());

        if (form.getStartDate().compareTo(today) == -1) {
            errors.rejectValue("startDate", "valid.startDate.time");
        }

        if (form.getEndDate().compareTo(today) == -1) {
            errors.rejectValue("endDate", "valid.endDate.time");
        }

        if (form.getStartDate().compareTo(form.getEndDate()) == 1) {
            errors.rejectValue("endDate", "valid.compare.time");
        }
    }
}
