using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(closing_store.Startup))]
namespace closing_store
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
