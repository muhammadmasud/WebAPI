using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using StudentDLL;


namespace StudentInformationApp.Controllers
{
    [EnableCors("*", "*", "*")]
    public class StudentController : ApiController
    {
        [DisableCors]
        public HttpResponseMessage Get()
        {
            try
            {
                using (StudentInfoEntities db = new StudentInfoEntities())
                {
                    var entity =  db.StudentInfoes.ToList();
                    if (entity != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, entity);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound,
                            "Student not found");
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
        public HttpResponseMessage Get(int id)
        {
            using (StudentInfoEntities db = new StudentInfoEntities())
            {
                var entity =  db.StudentInfoes.FirstOrDefault(s => s.Id == id);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound,
                        "Student with ID: " + id.ToString() + " not found");
                }
            }
        }
        [DisableCors]
        public HttpResponseMessage Post([FromBody] StudentInfo oStudentInfo)
        {
            try
            {
                using (var db = new StudentInfoEntities())
                {
                    db.StudentInfoes.Add(oStudentInfo);
                    db.SaveChanges();
                    var message = Request.CreateResponse(HttpStatusCode.Created, oStudentInfo);
                    message.Headers.Location = new Uri(Request.RequestUri +"/"+ oStudentInfo.Id.ToString());
                    return message;
                }
            }
            catch (Exception ex)
            {
              return  Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
        [DisableCors]
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (var db = new StudentInfoEntities())
                {
                    var entity = db.StudentInfoes.FirstOrDefault(s => s.Id == id);
                    if (entity == null)
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound,
                            "Student with ID : " + id.ToString() + " not found");
                    }
                    else
                    {
                        db.StudentInfoes.Remove(entity);
                        db.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        public HttpResponseMessage Put(int id, [FromBody] StudentInfo oStudentInfo)
        {
            try
            {
                using (var db = new StudentInfoEntities())
                {
                    var entity = db.StudentInfoes.FirstOrDefault(s => s.Id == id);
                    if (entity == null)
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound,
                            "Student with ID : " + id.ToString() + " not found");
                    }
                    else
                    {
                        entity.FirstName = oStudentInfo.FirstName;
                        entity.LastName = oStudentInfo.LastName;
                        entity.Address = oStudentInfo.Address;
                        entity.Email = oStudentInfo.Email;
                        entity.Phone = oStudentInfo.Phone;
                        db.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
