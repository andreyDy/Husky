package ua.kiev.husky.model;

import ua.kiev.husky.validation.ModuleForm;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Modules")
public class Module {
    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(name="short_description", nullable = false)
    private String shortDescription;

    @Column(nullable = false)
    private String article;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @OneToMany(mappedBy = "module", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Set<Video> videos = new HashSet<>();

    protected Module() {
    }

    public Module(ModuleForm moduleForm) {
        this.name = moduleForm.getName();
        this.shortDescription = moduleForm.getShortDescription();
        this.article = moduleForm.getArticle();
        for (String link : moduleForm.getLinks()) {
            Video video = new Video(link);
            video.setModule(this);
            videos.add(video);
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Set<Video> getVideos() {
        return videos;
    }

    public void setVideos(Set<Video> videos) {
        this.videos = videos;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Module module = (Module) o;

        if (id != module.id) return false;
        return name != null ? name.equals(module.name) : module.name == null;

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Module{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", article='").append(article).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
