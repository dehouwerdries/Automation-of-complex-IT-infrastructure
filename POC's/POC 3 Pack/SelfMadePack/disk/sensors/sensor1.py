import eventlet

import psutil

from st2reactor.sensor.base import PollingSensor


class DiskSensor(PollingSensor):
    def __init__(self, sensor_service, config, poll_interval=30):
        super(DiskSensor, self).__init__(sensor_service=sensor_service, config=config, poll_interval=poll_interval)
        self._logger = self.sensor_service.get_logger(name=self.__class__.__name__)
        self._stop = False



    def setup(self):
        
        self._poll_interval = self._config.get('poll_interval', None)
        self._mount_point = self._config.get('mount_point', None)
        self._max_percentage = self._config.get('max_disk_percentage', None)
        self._extend_amount = self._config.get('extend_amount', None)
        self._logical_volume_path = self._config.get('logical_volume_path', None)   



    def poll(self):
        disk_u = dict(psutil.disk_usage(self._mount_point)._asdict())
        disk_percentage = disk_u["percent"]

        if disk_percentage > self._max_percentage:
            self._logger.debug("DiskSensor dispatching trigger...")
            count = self.sensor_service.get_value("disk.count") or 0
            payload = {"lv_path": self._logical_volume_path, "extend": self._extend_amount, "count": int(count) + 1}
            self.sensor_service.dispatch(trigger="disk.event1", payload=payload)
            self.sensor_service.set_value("disk.count", payload["count"])


    def cleanup(self):
        self._stop = True
		

    # Methods required for programmable sensors.
    def add_trigger(self, trigger):
        pass

    def update_trigger(self, trigger):
        pass

    def remove_trigger(self, trigger):
        pass
