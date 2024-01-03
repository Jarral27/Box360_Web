using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Box360_Web.Startup))]
namespace Box360_Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
