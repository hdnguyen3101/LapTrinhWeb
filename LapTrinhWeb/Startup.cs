using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LapTrinhWeb.Startup))]
namespace LapTrinhWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
