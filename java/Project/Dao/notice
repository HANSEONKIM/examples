package dao;

import java.util.ArrayList;

import service.NoticeServiceImpl;
import vo.NoticeVo;
import data.Database;

public class NoticeDaoImpl implements NoticeDao {

	private static NoticeDaoImpl instance;

	private NoticeDaoImpl() {

	}

	public static NoticeDaoImpl getInstance() {
		if (instance == null) {
			instance = new NoticeDaoImpl();
		}
		return instance;

	}

	Database database = Database.getInstance();

	@Override
	public NoticeVo selecNotice(String key, int value) {

		for (int i = 0; i < database.tb_notice.size(); i++) {
			NoticeVo nv = database.tb_notice.get(i);

			if (key.equals(database.tb_notice.get(i))) {
				if (nv.getNoticeNum() == value) {
					return nv;
				}
			}
		}
		return null;
	}

	@Override
	public ArrayList<NoticeVo> selectNoticeList() {

		return database.tb_notice;
	}

	@Override
	public void insertNotice(NoticeVo nv) {
		database.tb_notice.add(nv);
	}

	@Override
	public void deleteNotice(int nv) {
		database.tb_notice.remove(nv);
	}

	@Override
	public void modifyNotice(NoticeVo nv) {

		for (int i = 0; i < database.tb_notice.size(); i++) {
			if (database.tb_notice.get(i).getNoticeNum() == nv.getNoticeNum()) {
				database.tb_notice.remove(i);
				break;
			}
		}

		database.tb_notice.add(nv);
	}

}
