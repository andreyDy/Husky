package ua.kiev.husky.validation;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import java.util.List;

public class ModuleForm {

    @NotNull
    @Size(min = 4, max = 45)
    private String name;

    @NotNull
    @Size(min = 50, max = 255)
    private String shortDescription;

    @NotNull
    @Size(min = 100, max = 4000)
    private String article;

    @NotNull
    private List<String> links;

    public ModuleForm() {
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

    public List<String> getLinks() {
        return links;
    }

    public void setLinks(List<String> links) {
        this.links = links;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("ModuleForm{");
        sb.append("name='").append(name).append('\'');
        sb.append(", article='").append(article).append('\'');
        sb.append(", links=").append(links);
        sb.append('}');
        return sb.toString();
    }
}
