package com.mmall.model;

import lombok.*;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class FileUpload {
    private Integer fileid;

    private String filename;

    private String fileurl;

    private Date uplodetime;

    public FileUpload(int fileid, String filename, String fileurl, Date uplodetime) {
        super();
        this.fileid = fileid;
        this.filename = filename;
        this.fileurl = fileurl;
        this.uplodetime = uplodetime;
    }

    public FileUpload(String filename, String fileurl, Date uplodetime) {
        this.filename = filename;
        this.fileurl = fileurl;
        this.uplodetime = uplodetime;
    }
}