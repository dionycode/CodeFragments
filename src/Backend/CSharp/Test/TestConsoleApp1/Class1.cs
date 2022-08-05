using System;
using System.Collections.Generic;
using System.Text;

namespace TestConsoleApp1
{
    public interface IAlertDAO
    {
        Guid AddAlert(DateTime time);
        DateTime GetAlert(Guid id);
    }

    public class AlertService
    {
        private readonly IAlertDAO _alertDAO;
        public AlertService(IAlertDAO alertDAO)
        {
            _alertDAO = alertDAO;
        }

        private readonly AlertDAO storage = new AlertDAO();

        public Guid RaiseAlert()
        {
            return _alertDAO.AddAlert(DateTime.Now);
        }

        public DateTime GetAlertTime(Guid id)
        {
            return _alertDAO.GetAlert(id);
        }
    }

    public class AlertDAO : IAlertDAO
    {
        private readonly Dictionary<Guid, DateTime> alerts = new Dictionary<Guid, DateTime>();

        public Guid AddAlert(DateTime time)
        {
            Guid id = Guid.NewGuid();
            this.alerts.Add(id, time);
            return id;
        }

        public DateTime GetAlert(Guid id)
        {
            return this.alerts[id];
        }
    }
}
