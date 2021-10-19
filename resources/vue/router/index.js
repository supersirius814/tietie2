import Vue from 'vue';
import Router from 'vue-router';


/**
 * Layzloading will create many files and slow on compiling, so best not to use lazyloading on devlopment.
 * The syntax is lazyloading, but we convert to proper require() with babel-plugin-syntax-dynamic-import
 * @see https://doc.laravue.dev/guide/advanced/lazy-loading.html
 */

Vue.use(Router);

/* Layout */
import Layout from '@/layout';

/**
 * Sub-menu only appear when children.length>=1
 * @see https://doc.laravue.dev/guide/essentials/router-and-nav.html
 **/

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
*                                if not set alwaysShow, only more than one route under the children
*                                it will becomes nested mode, otherwise not show the root menu
* redirect: noredirect           if `redirect:noredirect` will no redirect in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    roles: ['admin', 'editor']   Visible for these roles only
    permissions: ['view menu zip', 'manage user'] Visible for these permissions only
    title: 'title'               the name show in sub-menu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar
    noCache: true                if true, the page will no be cached(default is false)
    breadcrumb: false            if false, the item will hidden in breadcrumb (default is true)
    affix: true                  if true, the tag will affix in the tags-view
  }
**/

export const constantRoutes = [{
        path: '/redirect',
        component: Layout,
        hidden: true,
        children: [{
            path: '/redirect/:path*',
            component: () =>
                import ('@/views/redirect/index'),
        }, ],
    },
    {
        path: '/404',
        redirect: { name: 'Page404' },
        component: () =>
            import ('@/views/error-page/404'),
        hidden: true,
    },
    {
        path: '/401',
        component: () =>
            import ('@/views/error-page/401'),
        hidden: true,
    },
    {
        path: '/',
        component: Layout,
        redirect: '/maintenance',
        children: [{
                path: '/maintenance',
                component: () =>
                    import ('@/views/maintenance/List'),
                name: 'maintenance',
                meta: { title: 'メンテナンス', icon: 'documentation', noCache: true },
            },
            {
                path: 'maintenance/detail/:id(\\d+)',
                component: () =>
                    import ('@/views/maintenance/Detail'),
                name: 'MaintenanceDetail',
                meta: { title: 'メンテナンス情報　詳細', noCache: true },
                hidden: true,
            },
        ],
    },
    {
        path: '/user',
        component: Layout,
        redirect: '/maintenance/index',
        children: [{
            path: 'index',
            component: () =>
                import ('@/views/documentation/index'),
            name: 'user',
            meta: { title: 'ユーザー', icon: 'user', noCache: true },
        }, ],
    },
    {
        path: '/shop',
        component: Layout,
        redirect: '/maintenance/index',
        children: [{
            path: 'index',
            component: () =>
                import ('@/views/documentation/index'),
            name: 'shop',
            meta: { title: '店舗', icon: 'shopping', noCache: true },
        }, ],
    },
    {
        path: '/block',
        component: Layout,
        redirect: '/block/index',
        children: [{
            path: 'index',
            component: () =>
                import ('@/views/documentation/index'),
            name: 'block',
            meta: { title: 'ブロック', icon: 'tree', noCache: true },
        }, ],
    },
    {
        path: '/district',
        component: Layout,
        redirect: '/district/index',
        children: [{
            path: 'index',
            component: () =>
                import ('@/views/documentation/index'),
            name: 'district',
            meta: { title: 'ディストリクト', icon: 'location', noCache: true },
        }, ],
    },
    {
        path: '/client',
        component: Layout,
        redirect: '/client/index',
        children: [{
            path: 'index',
            component: () =>
                import ('@/views/documentation/index'),
            name: 'client',
            meta: { title: 'お取引先様', icon: 'peoples', noCache: true },
        }, ],
    },
    {
        path: '/csv',
        component: Layout,
        redirect: '/csv/import',
        meta: { title: 'CSV', icon: 'excel' },
        children: [{
                path: 'import',
                component: () =>
                    import ('@/views/documentation/index'),
                name: 'import',
                meta: { title: 'インポート', icon: 'upload', noCache: true },
            },
            {
                path: 'export',
                component: () =>
                    import ('@/views/documentation/index'),
                name: 'export',
                meta: { title: 'エクスポート', icon: 'download', noCache: true },
            },
        ],
    },
];

export const asyncRoutes = [{
        path: '/element-ui',
        component: Layout,
        redirect: '/element-ui/icons',
        children: [{
            path: 'icons',
            component: () =>
                import ('@/views/icons/index'),
            name: 'Icons',
            meta: { title: 'icons', icon: 'el-icon-info', noCache: true },
        }, ],
    },
    {
        path: '/external-link',
        component: Layout,
        children: [{
            path: 'https://github.com/tuandm/laravue',
            meta: { title: 'ログアウト', icon: 'left-arrow' },
        }, ],
    },
    // {
    //     path: '/external-link',
    //     component: Layout,
    //     children: [{
    //         path: 'https://github.com/tuandm/laravue',
    //         meta: { title: 'externalLink', icon: 'link' },
    //     }, ],
    // },
    { path: '*', redirect: '/404', hidden: true },
];

const createRouter = () => new Router({
    // mode: 'history',
    // mode: 'history', // require service support
    // fallback: false,
    scrollBehavior: () => ({ y: 0 }),
    base: process.env.MIX_LARAVUE_PATH,
    routes: constantRoutes,
    // routes: [
    //     { path: "/", component: Layout }
    //     // ... other routes ...
    //     // and finally the default route, when none of the above matches:
    //     // { path: "*", component: Layout }
    // ]
});

const router = createRouter();

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
    const newRouter = createRouter();
    router.matcher = newRouter.matcher; // reset router
}

export default router;