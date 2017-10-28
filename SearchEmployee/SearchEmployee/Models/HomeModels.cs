using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SearchEmployee.Models
{
	public class DBConnection : DbContext
	{
		public DBConnection() : base("name=Connection")
		{
		}

		public DbSet<Employee> Employee { get; set; }
		public DbSet<Countries> Countries { get; set; }
		public DbSet<Cities> Cities { get; set; }
	}

	[Table("Employee")]
	public class Employee
	{
		[Key]
		public int ID { get; set; }

		[Required(ErrorMessage = "Enter Surname")]
		public string Surname { get; set; }

		[Required(ErrorMessage = "Enter Name")]
		public string Name { get; set; }

		public string MiddleName { get; set; }
		public string PhoneNumber { get; set; }

		[Required(ErrorMessage = "Enter Email")]
		[EmailAddress(ErrorMessage = "Enter correct Email")]
		public string Email { get; set; }

		public string Country { get; set; }
		public string City { get; set; }
		public string IIN { get; set; }
	}

	public class Countries
	{
		[Key]
		public int ID { get; set; }
		public string Code { get; set; }
		public string Name { get; set; }
	}

	public class Cities
	{
		[Key]
		public int ID { get; set; }
		public string Code { get; set; }
		public string Name { get; set; }
		public string CountryCode { get; set; }
	}
}