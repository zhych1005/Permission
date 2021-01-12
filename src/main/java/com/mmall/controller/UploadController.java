package com.mmall.controller;

import com.mmall.beans.PageQuery;
import com.mmall.common.JsonData;
import com.mmall.dao.FileUploadMapper;
import com.mmall.model.FileUpload;
import com.mmall.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.Iterator;

/**
 * @author: Administrator
 * @projectName: Permission
 * @className: UploadController
 * @date: 2019/06/26 10:35
 * @description:
 */
@Controller
@RequestMapping("/file")
public class UploadController {

    @Resource
    private FileService fileService;
    @Resource
    private FileUploadMapper uploadMapper;

    @RequestMapping("/addFile.page")
    public ModelAndView addFile() {
        return new ModelAndView("fileUpload");
    }

    @RequestMapping("/uploadFile.json")
    @ResponseBody
    public ModelAndView uplodeFile(HttpServletRequest request) throws Exception {
        long startTime = System.currentTimeMillis();
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            MultipartHttpServletRequest multiRequest = resolver.resolveMultipart(request);
            // 获取multiRequest 中所有的文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next());
                if (!file.isEmpty()) {
                    String path = "/data0/file/" + file.getOriginalFilename();
                    file.transferTo(new File(path));
                    String fileurl = "http://39.98.243.75/load/" + file.getOriginalFilename();

                    FileUpload upload = new FileUpload(file.getOriginalFilename(), fileurl, new Date());
                    int count = uploadMapper.countByFilename(file.getOriginalFilename());
                    if (count > 0) {
                        return new ModelAndView("fileRepeat");
                    }
                    fileService.uploadFile(upload);
                } else {
                    System.out.println("上传文件不能为空");
                    return new ModelAndView("fileError");
                }
            }
        }
        long endTime = System.currentTimeMillis();
        System.out.println("上传所花时间：" + (endTime - startTime) + "ms");
        return new ModelAndView("fileUpload");
    }


    /**
     * 文件的删除操作
     * @param fileUpload
     * @return
     */
    @RequestMapping("/deleteFile.json")
    @ResponseBody
    public ModelAndView deleteFile(FileUpload fileUpload){
        fileService.deleFile(fileUpload.getFileid());
        File file = new File("/data0/file/" + fileUpload.getFilename());
        if (file.exists()){
            file.delete();
        }
        return new ModelAndView("fileUpload");
    }

    /**
     * 文件列表的载入
     * @return
     */
    @RequestMapping("/findAllFile.json")
    @ResponseBody
    public JsonData findAllFile(PageQuery page) {
        return JsonData.success(fileService.findAllFile(page));
    }

    @RequestMapping("/consult.page")
    @ResponseBody
    public ModelAndView consult(){
        return new ModelAndView("consult");
    }
}