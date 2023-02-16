$ ->
    $(window).on "load",()->
        $("body").append """
        <div style="
            z-index:99999;
            position:fixed;
            top:20px;right:20px;
            min-width:200px;min-height:50px;
            background:rgba(255,255,255,0.5);border-radius:6px;">
            请输入页面编号ID
            <textarea class="page_ids"></textarea>
            <button class="action_add">添加地址</button>
            <button class="action_run">开始添加购物车</button>
            <button class="action_continue">继续购物车</button>
            <button class="action_stop">停止购物车</button>
        </div>
        """

        page_ids_list=JSON.parse(localStorage.getItem("page_ids_list"))
        page_ids_num =localStorage.getItem("page_ids_num")
        page_ids_run = localStorage.getItem("page_ids_run")
        if page_ids_list == null
            page_ids_list = []
        if page_ids_num == null
            page_ids_num = 0
        else
            page_ids_num = parseInt(page_ids_num)
        if page_ids_run == null
            page_ids_run = "false"
        if window.location.host in ["www.jd.com"]
            window.location.href = "https://item.jd.com/100006199369.html"
        if window.location.host in ["cart.jd.com"]
            window.location.href = "https://item.jd.com/100006199369.html"
        if window.location.host in ["item.jd.com"]
            if window.location.href == "https://item.jd.com/100006199369.html"
                if page_ids_list.length != 0
                    window.location.href = "https://item.jd.com/#{page_ids_list[page_ids_num]}.html"
            else
                if page_ids_run == "true"
                    page_ids_num = page_ids_num+1
                    localStorage.setItem("page_ids_num",page_ids_num)
                    if page_ids_num >= page_ids_list.length
                        localStorage.setItem("page_ids_list",JSON.stringify([]))
                        localStorage.setItem("page_ids_num",0)
                        localStorage.setItem("page_ids_run","false")
                    $("#InitCartUrl")[0].click()
        
        $("body").on "click",".action_continue",(evt)->
            localStorage.setItem("page_ids_run","true")
        $("body").on "click",".action_stop",(evt)->
            localStorage.setItem("page_ids_run","false")
        $("body").on "click",".action_add",(evt)->
            page_ids_list = $(".page_ids").val().split(",")
            page_ids_num = 0
            localStorage.setItem("page_ids_list",JSON.stringify(page_ids_list))
            localStorage.setItem("page_ids_num",page_ids_num)
            localStorage.setItem("page_ids_run","true")
        $("body").on "click",".action_run",(evt)->
            window.location.href = "https://item.jd.com/#{page_ids_list[page_ids_num]}.html"

