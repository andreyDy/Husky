package ua.kiev.husky.model;

import javax.persistence.*;

@Entity
@Table(name = "Videos")
public class Video {
    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = false)
    private String link;

    @ManyToOne
    @JoinColumn(name = "module_id", nullable = false)
    private Module module;

    protected Video() {
    }

    public Video(String link) {
        this.link = link;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Video video = (Video) o;

        if (id != video.id) return false;
        return link != null ? link.equals(video.link) : video.link == null;

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (link != null ? link.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Video{");
        sb.append("id=").append(id);
        sb.append(", link='").append(link).append('\'');
        sb.append(", module=").append(module);
        sb.append('}');
        return sb.toString();
    }
}
