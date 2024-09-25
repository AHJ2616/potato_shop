package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.AlarmsVO;

@Mapper
public interface Alarm_mapper {
	
	//1.유저가 활동을 하면 알람을 만든다.
	public int add_alarm(AlarmsVO alarms);
	
	//2.알람내역을 불러온다
	public List<AlarmsVO> get_alarms(AlarmsVO alarms);
	
	//3.알람을 삭제한다(1개)
	public int delete_alarm(AlarmsVO alrams);
	
	//4.알람을 삭제한다(전체)
	public int delete_alarm2(AlarmsVO alrams);
	
	//5.알람을 읽음 표시
	public int status_alarm(AlarmsVO alrams);
	

}//class end
