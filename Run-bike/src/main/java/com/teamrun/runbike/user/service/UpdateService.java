package com.teamrun.runbike.user.service;

import java.io.File;
import java.io.IOException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.LoginInfo;
import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.domain.RequestEditInfo;
import com.teamrun.runbike.user.domain.UserInfo;

@Service("updateService")
public class UpdateService implements UserService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private UserDao dao; 
	
	public int updateInfo(MultipartHttpServletRequest request, String oldFile, RequestEditInfo editInfo) {
		
		dao = template.getMapper(UserDao.class);
		int result = 0;
		
		UserInfo userInfo = editInfo.toUserInfo();
		
		if(editInfo.getU_photo()!=null && !editInfo.getU_photo().isEmpty() && editInfo.getU_photo().getSize() > 0) {
			
			String newFile = editInfo.getU_photo().getOriginalFilename();
			String dir = request.getSession().getServletContext().getRealPath("/uploadfile/userphoto");
			
			try {
				userInfo.setU_photo(newFile);				
				editInfo.getU_photo().transferTo(new File(dir, newFile));
				
				if(oldFile != "noImg.jpg") {					
					new File(dir, oldFile).delete();
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			userInfo.setU_photo(oldFile);
		}
		
		result = dao.editUser(userInfo);
		
		
		
		return result;
	}
}
