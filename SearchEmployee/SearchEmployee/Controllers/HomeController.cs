using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SearchEmployee.Models;
using System.Web.Script.Serialization;

namespace SearchEmployee.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult About()
		{
			ViewBag.Message = "Your application description page.";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}

		public ActionResult Search()
		{
			ViewBag.Message = "Search";
			ViewBag.Countries = getCountries();
			ViewBag.Cities = getCities();

			return View();
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Search(Employee emp)
		{
			ViewBag.Countries = getCountries();
			ViewBag.Cities = getCities();
			IEnumerable<Employee> table = null;

			if (ModelState.IsValid)
			{
				table = getSearchResult(emp);
			}
				
			return PartialView("SearchResult", table);
		}

		public ActionResult SearchByIIN()
		{
			return View();
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult SearchByIIN(Employee emp)
		{
			IEnumerable<Employee> table = null;

			if (ModelState.IsValid)
			{
				table = getSearchResult(emp);
			}

			return PartialView("SearchResult", table);
		}

		[HttpPost]
		public ActionResult getCitiesByID(string countryCode)
		{
			var context = new DBConnection();
			var list = context.Cities.Where(c => c.CountryCode == countryCode).ToList();
			JavaScriptSerializer js = new JavaScriptSerializer();
			var result = js.Serialize(list);
			return Json(result, JsonRequestBehavior.AllowGet);
		}

		private List<Countries> getCountries()
		{
			var context = new DBConnection();
			var list = context.Countries.ToList();
			return list;
		}

		private List<Cities> getCities()
		{
			var context = new DBConnection();
			var list = context.Cities.ToList();
			return list;
		}

		private IEnumerable<Employee> getSearchResult(Employee emp)
		{
			IEnumerable<Employee> table = null;
			var context = new DBConnection();
			table = (from e in context.Employee
					 where e.Surname.ToUpper() == emp.Surname.ToUpper()
					 && e.Name.ToUpper() == emp.Name.ToUpper()
					 && e.Email.ToUpper() == emp.Email.ToUpper()
					 && (string.IsNullOrEmpty(emp.MiddleName) || e.MiddleName.ToUpper() == emp.MiddleName.ToUpper())
					 && (string.IsNullOrEmpty(emp.PhoneNumber) || e.PhoneNumber == emp.PhoneNumber)
					 && (string.IsNullOrEmpty(emp.Country) || e.Country == emp.Country)
					 && (string.IsNullOrEmpty(emp.City) || e.City == emp.City)
					 && (string.IsNullOrEmpty(emp.IIN) || e.IIN == emp.IIN)
					 select e).ToList();


			if (table.Any())
			{
				var countries = getCountries();
				var cities = getCities();
				foreach (var item in table)
				{
					var r1 = countries.Find(x => x.ID == Convert.ToInt16(item.Country));
					item.Country = r1.Name;

					var r2 = cities.Find(x => x.ID == Convert.ToInt16(item.City));
					item.City = r2.Name;
				}
			}
			return table;
		}
	}
}