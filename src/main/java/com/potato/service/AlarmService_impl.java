package com.potato.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.potato.domain.AlarmsVO;
import com.potato.mapper.Alarm_mapper;
import com.potato.mapper.Member_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Service
@Log4j2
@AllArgsConstructor
public class AlarmService_impl implements AlarmService {

	private Alarm_mapper mapper;
	
	@Override
	public int add_alarm(AlarmsVO alarms) {
		// TODO 1.유저가 활동을 하면 알람을 만든다.
		return mapper.add_alarm(alarms);
	}

	@Override
	public List<AlarmsVO> get_alarms(AlarmsVO alarms) {
		// TODO 2.알람내역을 불러온다
		return mapper.get_alarms(alarms);
	}

	@Override
	public int delete_alarm(AlarmsVO alrams) {
		// TODO 3.알람을 삭제한다
		return mapper.delete_alarm(alrams);
	}

	@Override
	public int delete_alarm2(AlarmsVO alrams) {
		// TODO 4.알람을 삭제한다(전체)
		return mapper.delete_alarm2(alrams);
	}

	@Override
	public int status_alarm(AlarmsVO alrams) {
		// TODO 5.알람을 읽음 표시
		return mapper.status_alarm(alrams);
	}
	

}
