<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <base href="${path_home}/">
        <meta charset="UTF-8">
        <title>ueditor图片对话框</title>
        <script type="text/javascript" src="lib/ueditor/dialogs/internal.js"></script>

        <!-- jquery -->
        <script type="text/javascript" src="lib/ueditor/third-party/jquery-1.10.2.min.js"></script>

        <!-- webuploader -->
        <script src="lib/ueditor/third-party/webuploader/webuploader.min.js"></script>
        <link rel="stylesheet" type="text/css" href="lib/ueditor/third-party/webuploader/webuploader.css">

        <!-- image dialog -->
        <link rel="stylesheet" href="lib/ueditor/dialogs/image/image.css" type="text/css" />
    </head>
    <body>

        <div class="wrapper">
            <div id="tabhead" class="tabhead">
                <span class="tab" data-content-id="remote"><var id="lang_tab_remote"></var></span>
                <span class="tab focus" data-content-id="upload"><var id="lang_tab_upload"></var></span>
                <span class="tab" data-content-id="online"><var id="lang_tab_online"></var></span>
                <span class="tab" data-content-id="search"><var id="lang_tab_search"></var></span>
            </div>
            <div class="alignBar">
                <label class="algnLabel"><var id="lang_input_align"></var></label>
                <span id="alignIcon">
                    <span id="noneAlign" class="none-align focus" data-align="none"></span>
                    <span id="leftAlign" class="left-align" data-align="left"></span>
                    <span id="rightAlign" class="right-align" data-align="right"></span>
                    <span id="centerAlign" class="center-align" data-align="center"></span>
                </span>
                <input id="align" name="align" type="hidden" value="none"/>
            </div>
            <div id="tabbody" class="tabbody">

                <!-- 远程图片 -->
                <div id="remote" class="panel">
                    <div class="top">
                        <div class="row">
                            <label for="url"><var id="lang_input_url"></var></label>
                            <span><input class="text" id="url" type="text"/></span>
                        </div>
                    </div>
                    <div class="left">
                        <div class="row">
                            <label><var id="lang_input_size"></var></label>
                            <span><var id="lang_input_width">&nbsp;&nbsp;</var><input class="text" type="text" id="width"/>px </span>
                            <span><var id="lang_input_height">&nbsp;&nbsp;</var><input class="text" type="text" id="height"/>px </span>
                            <span><input id="lock" type="checkbox" disabled="disabled"><span id="lockicon"></span></span>
                        </div>
                        <div class="row">
                            <label><var id="lang_input_border"></var></label>
                            <span><input class="text" type="text" id="border"/>px </span>
                        </div>
                        <div class="row">
                            <label><var id="lang_input_vhspace"></var></label>
                            <span><input class="text" type="text" id="vhSpace"/>px </span>
                        </div>
                        <div class="row">
                            <label><var id="lang_input_title"></var></label>
                            <span><input class="text" type="text" id="title"/></span>
                        </div>
                    </div>
                    <div class="right"><div id="preview"></div></div>
                </div>

                <!-- 上传图片 -->
                <div id="upload" class="panel focus">
                    <div id="queueList" class="queueList">
                        <div class="statusBar element-invisible">
                            <div class="progress">
                                <span class="text">0%</span>
                                <span class="percentage"></span>
                            </div><div class="info"></div>
                            <div class="btns">
                                <div id="filePickerBtn"></div>
                                <div class="uploadBtn"><var id="lang_start_upload"></var></div>
                            </div>
                        </div>
                        <div id="dndArea" class="placeholder">
                            <div class="filePickerContainer">
                                <div id="filePickerReady"></div>
                            </div>
                        </div>
                        <ul class="filelist element-invisible">
                            <li id="filePickerBlock" class="filePickerBlock"></li>
                        </ul>
                    </div>
                </div>

                <!-- 在线图片 -->
                <div id="online" class="panel">
                    <div id="imageList"><var id="lang_imgLoading"></var></div>
                </div>

                <!-- 搜索图片 -->
                <div id="search" class="panel">
                    <div class="searchBar">
                        <input id="searchTxt" class="searchTxt text" type="text" />
                        <select id="searchType" class="searchType">
                            <option value="&s=4&z=0"></option>
                            <option value="&s=1&z=19"></option>
                            <option value="&s=2&z=0"></option>
                            <option value="&s=3&z=0"></option>
                        </select>
                        <input id="searchReset" type="button"  />
                        <input id="searchBtn" type="button"  />
                    </div>
                    <div id="searchList" class="searchList"><ul id="searchListUl"></ul></div>
                </div>

            </div>
        </div>
        <script type="text/javascript" src="lib/ueditor/dialogs/image/image.js"></script>

    </body>
</html>