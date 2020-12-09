<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="自然日">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyyMMdd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions"
          :default-value="this.dateRange"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="日期类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择日期类型" clearable size="small">
          <el-option
            v-for="dict in typeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="宜" prop="suit">
        <el-input
          v-model="queryParams.suit"
          placeholder="请输入宜"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="忌" prop="avoid">
        <el-input
          v-model="queryParams.avoid"
          placeholder="请输入忌"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="20" class="mb8">
      <!--<el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:calendar:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:calendar:edit']"
        >修改</el-button>
      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:calendar:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:calendar:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-date-picker
          v-model="dateSyncRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          v-hasPermi="['system:calendar:doSync']"
        ></el-date-picker>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-thumb"
          size="mini"
          @click="syncCalendar"
          v-hasPermi="['system:calendar:doSync']"
        >同步</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="calendarList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="自然日日期" align="center" prop="dateStr" />
      <el-table-column label="日期描述" align="center" prop="typeName" />
      <el-table-column label="年份" align="center" prop="yearName" />
      <el-table-column label="农历" align="center" prop="nongLiCn" />
      <el-table-column label="农历月份" align="center" prop="nongLi" />
      <el-table-column label="生肖年" align="center" prop="animalsYear" />
      <el-table-column label="节气" align="center" prop="throttle" />
      <el-table-column label="周-中文" align="center" prop="weekCn" />
      <el-table-column label="周期英文" align="center" prop="week3" />
      <el-table-column label="天数" align="center" prop="dayNum" />
      <el-table-column label="周数" align="center" prop="weekNum" />
      <el-table-column label="宜" align="center" prop="suit" />
      <el-table-column label="忌" align="center" prop="avoid" />
      <el-table-column label="假日描述" align="center" prop="desc" />
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <!--<el-button
          size="mini"
          type="text"
          icon="el-icon-edit"
          @click="handleUpdate(scope.row)"
          v-hasPermi="['system:calendar:edit']"
        >修改</el-button>-->
        <el-button
          size="mini"
          type="text"
          icon="el-icon-delete"
          @click="handleDelete(scope.row)"
          v-hasPermi="['system:calendar:remove']"
        >删除</el-button>
      </template>
    </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改工作日历对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCalendar, getCalendar, delCalendar, addCalendar, updateCalendar, exportCalendar, syncCalendar} from "@/api/system/calendar";

export default {
  name: "Calendar",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 工作日历表格数据
      calendarList: [],
      // 日期范围
      dateRange: [],
      // 同步日期范围
      dateSyncRange: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期类型字典
      typeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        type: null,
        suit: null,
        avoid: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 日期选择器
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            const end = new Date();
            end.setHours(23, 59, 59);
            const start = new Date(end);
            start.setTime(end.getTime() - 3600 * 1000 * 24 + 1000);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            end.setHours(23, 59, 59);
            start.setTime(end.getTime() - 3600 * 1000 * 24 * 7 + 1000);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            end.setHours(23, 59, 59);
            start.setTime(end.getTime() - 3600 * 1000 * 24 * 30 + 1000);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            end.setHours(23, 59, 59);
            start.setTime(end.getTime() - 3600 * 1000 * 24 * 90 + 1000);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一年',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            end.setHours(23, 59, 59);
            start.setTime(end.getTime() - 3600 * 1000 * 24 * 365 + 1000);
            picker.$emit('pick', [start, end]);
          }
        }]
      }
    };
  },
  created() {
    this.dateRange.push(this.handleTimeOld(new Date())) // handleTimeOld是我用来获取当月的第一天的
    this.dateRange.push(this.handleTimeNew(new Date())) // handleTimeNew是获取今天的日期
    this.getList();
    this.getDicts("sys_calendar_type").then(response => {
      this.typeOptions = response.data;
    });
  },
  methods: {
    /** 查询工作日历列表 */
    getList() {
      this.loading = true;
      /*if (this.dateRange) {
        this.dateRange[0] = this.dateRange[0].replace(/\-/g,'');
        this.dateRange[1] = this.dateRange[1].replace(/\-/g,'');
      }*/
      listCalendar(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.calendarList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 日期类型字典翻译
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeOptions, row.type);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        type: null,
        typeName: null,
        yearName: null,
        nongLiCn: null,
        nongLi: null,
        animalsYear: null,
        throttle: null,
        weekCn: null,
        week1: null,
        week2: null,
        week3: null,
        dayNum: null,
        weekNum: null,
        suit: null,
        avoid: null,
        desc: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 多选框选中数据*/
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.dateStr)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加工作日历";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const dateStr = row.dateStr || this.ids
      getCalendar(dateStr).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改工作日历";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.dateStr != null) {
            updateCalendar(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCalendar(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const dateStrs = row.dateStr || this.ids;
      this.$confirm('是否确认删除工作日历编号为"' + dateStrs + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return delCalendar(dateStrs);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch(err => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有工作日历数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return exportCalendar(queryParams);
      }).then(response => {
        this.download(response.msg);
      }).catch((err) => {
      })
    },
    /** 同步日期 */
    syncCalendar() {
      const dateSyncRange = this.dateSyncRange;
      if (!dateSyncRange || dateSyncRange.length == 0) {
        this.$confirm('请选择同步日期区间?', "警告", {
          confirmButtonText: "确定",
          type: "warning"
        }).catch((err) => {
        });
        return;
      }
      var dateSync = {};
      dateSync.beginTime = dateSyncRange[0];
      dateSync.endTime = dateSyncRange[1];

      this.$confirm('是否确认同步工作日历为" ' + dateSyncRange[0] + '至' + dateSyncRange[1] + ' "的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function() {
        return syncCalendar(dateSync);
      }).catch((err) => {
      })

    },
    /**是我用来获取当月的第一天的*/
    handleTimeOld(time, split) {
      let date = new Date(time);
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      split = '';
      return [year, month, 1].map(num => this.formatNumber(num)).join(split);
    },
    /**handleTimeNew是获取今天的日期*/
    handleTimeNew(time) {
      let date = new Date(time);
      let year = date.getFullYear();
      let month = (date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
      let day = date.getDate() > 10 ? date.getDate() : ('0' + date.getDate());
      return `${year}${month}${day}`;
    },
    formatNumber(number) {
      return String(number)[1] ? String(number) : `0${number}`;
    }
  }
};
</script>
