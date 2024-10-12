using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(closing_store.Startup))]

namespace closing_store
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // OWIN middleware configurations go here.
        }
    }
}