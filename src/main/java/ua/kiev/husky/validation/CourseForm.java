package ua.kiev.husky.validation;

import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class CourseForm {

    @NotNull
    @Size(min = 3, max = 15)
    private String name;

    @NotNull
    @Size(min = 5, max = 25)
    private String shortDescription;

    @NotNull
    @Size(min = 50, max = 500)
    private String description;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate endDate;

    public CourseForm() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("CourseForm{");
        sb.append("name='").append(name).append('\'');
        sb.append(", shortDescription='").append(shortDescription).append('\'');
        sb.append(", description='").append(description).append('\'');
        sb.append(", startDate=").append(startDate);
        sb.append(", endDate=").append(endDate);
        sb.append('}');
        return sb.toString();
    }
}
