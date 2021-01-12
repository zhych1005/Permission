package com.mmall.service;

import com.mmall.beans.PageQuery;
import com.mmall.beans.PageResult;
import com.mmall.dao.FileUploadMapper;
import com.mmall.model.FileUpload;
import com.mmall.util.BeanValidator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: FileService
 * @date: 2019/06/26 10:22
 * @description:
 */

@Service
@Transactional(rollbackFor=Exception.class)
public class FileService {

    @Resource
    private FileUploadMapper uploadMapper;

    /**
     * 文件上传
     * @param fileUpload
     * @return
     * @throws Exception
     */
    public boolean uploadFile(FileUpload fileUpload) throws Exception {
        return uploadMapper.uploadFile(fileUpload);
    }

    /**
     * 文件的删除
     */
    public void deleFile(Integer fileid) {
        uploadMapper.deleteByPrimaryKey(fileid);
    }

    /**
     * 获取文件列表
     */
    public PageResult<FileUpload> findAllFile(PageQuery page) {
        BeanValidator.check(page);
        int count = uploadMapper.countAllFile();
        if (count > 0) {
            List<FileUpload> list = uploadMapper.findAllFile(page);
            return PageResult.<FileUpload>builder().total(count).data(list).build();
        }
        return PageResult.<FileUpload>builder().build();
    }
}