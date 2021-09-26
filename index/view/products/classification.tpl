{include file="../header.tpl"}
    <link rel="stylesheet" href="./public/index/vendor/datatables/dataTables.bs4.css" />
    <link rel="stylesheet" href="./public/index/vendor/datatables/dataTables.bs4-custom.css" />
    <link rel="stylesheet" href="./public/index/vendor/datatables/buttons.bs.css" rel="stylesheet" />
    <div class="content-wrapper">
        <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="dt-buttons">
                                <a href="./index.php?m=Products&a=add_classification">
                                    <button class="dt-button buttons-copy buttons-html5" tabindex="0" aria-controls="copy-print-scroll" type="button">
                                        <span>添加</span>
                                    </button>
                                </a>
                            </div>
                            <table id="classification" class="table v-middle" style="text-align: center;">
                                <thead style="text-indent: 1rem;">
                                    <tr>
                                      <th>项目编号</th>
                                      <th>项目名称</th>
                                      <th>漏洞数量</th>
                                      <th>提交时间</th>
                                      <th>修改时间</th>
                                      <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./public/index/vendor/datatables/dataTables.min.js"></script>
    <script src="./public/index/vendor/datatables/dataTables.bootstrap.min.js"></script>
    <script src="./public/index/vendor/datatables/custom/custom-datatables.js"></script>
    <script>
        $("#classification").DataTable({
            "bJQueryUI": true,
            'aLengthMenu': [[10, 20, 30, 40, 50], ['10', '20', '30', '40', '50']],
            'bFilter': false,
            'bSortClasses': true,
            'bSort': true,
            'order': [[0, 'desc']],
            'bInfo' : true,
            "paging": true,
            "ordering": false,
            "info": true,
            "lengthChange": false,
            "searching": true,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": "./index.php?m=Products&a=classification",
                "type":"POST"
            },
            "pagingType": "full_numbers",
            "columns": [
                {
                    "data": "id"
                },
                {
                    "data": "title"
                },
                {
                    "data": "num"
                },
                {
                    "data": "creation_time"
                },
                {
                    "data": "update_time"
                },
                {
                    "data": function (row, type, val, meta) {
                        text = ""
                        text += '<div class="actions">'
                        text += '<a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="" data-original-title="查看漏洞"><i class="icon-visibility text-info"></i>&nbsp;</a>'
                        text += '<a href="./index.php?m=Products&a=edit_classification&id='+row.id+'" data-toggle="tooltip" data-placement="top" title="" data-original-title="编辑"><i class="icon-edit1 text-info"></i>&nbsp;</a>'
                        text += '<a href="./index.php?m=Products&a=del_classification&id='+row.id+'&token={$token}" data-toggle="tooltip" data-placement="top" title="" data-original-title="删除"><i class="icon-x-circle text-danger"></i>&nbsp;</a>'
                        text += '</div>'
                        return text
                    }
                },
            ],
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        });
    </script>
{include file="../footer.tpl"}