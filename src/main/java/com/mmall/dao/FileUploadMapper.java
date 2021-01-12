package com.mmall.dao;

import com.mmall.beans.PageQuery;
import com.mmall.model.FileUpload;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileUploadMapper {
    int deleteByPrimaryKey(Integer fileid);

    int insert(FileUpload record);

    int insertSelective(FileUpload record);

    FileUpload selectByPrimaryKey(Integer fileid);

    int updateByPrimaryKeySelective(FileUpload record);

    int updateByPrimaryKey(FileUpload record);

    /**
     * 文件上传
     * @param upload
     * @return
     * @throws Exception
     */
    boolean uploadFile(FileUpload upload) throws Exception;

    /**
     * 获取文件列表
     * @return
     */
    List<FileUpload> findAllFile(@Param("page") PageQuery page);

    /**
     * 获取上传文件的总数
     * @return
     */
    int countAllFile();

    /**
     * 文件上传重复性判断
     * @return
     */
    int countByFilename(String fliename);
}