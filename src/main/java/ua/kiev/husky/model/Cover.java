package ua.kiev.husky.model;


import org.springframework.web.multipart.MultipartFile;
import ua.kiev.husky.exception.PhotoErrorException;

import javax.persistence.*;
import java.io.IOException;


/**
 * Simple JavaBean object representing a cover.
 */
@Entity
@Table(name = "Covers")
public class Cover {
    @Id
    @GeneratedValue
    private int id;

    @Column(name = "file_name", nullable = false)
    private String fileName;

    /**
     * The File.
     */
    @Lob
    @Basic(fetch=FetchType.EAGER)
    protected  byte[] file;

    /**
     * Instantiates a new Cover.
     */
    protected Cover() {
    }

    /**
     * Instantiates a new Cover.
     *
     * @param file       the file
     * @param courseName the course name
     */
    public Cover(final MultipartFile file, final String courseName) {
        if (file.isEmpty()) {
            throw new PhotoErrorException();
        }
        final String type = file.getOriginalFilename().split("\\.")[1];
        final String fileName = courseName.trim() + "." + type;
        try {
            this.fileName = fileName;
            this.file = file.getBytes();
        } catch (IOException e) {
            throw new PhotoErrorException();
        }
    }

    /**
     * Gets id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets file name.
     *
     * @return the file name
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * Sets file name.
     *
     * @param fileName the file name
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * Get file byte [ ].
     *
     * @return the byte [ ]
     */
    public byte[] getFile() {
        return file;
    }

    /**
     * Sets file.
     *
     * @param file the file
     */
    public void setFile(byte[] file) {
        this.file = file;
    }
}
