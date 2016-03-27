using System.Web.Mvc;

namespace OctopusPlayground.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}