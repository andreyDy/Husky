package ua.kiev.husky.validation;

import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class UserForm {

    @NotNull
    @Size(min = 3, max = 15)
    private String firstName;

    @NotNull
    @Size(min = 3, max = 25)
    private String lastName;

    @NotNull
    @Size(min = 4, max = 15)
    private String password;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate birthday;

    protected UserForm() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("UserForm{");
        sb.append("firstName='").append(firstName).append('\'');
        sb.append(", lastName='").append(lastName).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", birthday=").append(birthday);
        sb.append('}');
        return sb.toString();
    }
}
