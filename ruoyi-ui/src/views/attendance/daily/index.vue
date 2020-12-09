<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日报时间">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions"
          :default-value="this.dateRange"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="日报内容" prop="daily">
        <el-input
          v-model="queryParams.daily"
          placeholder="请输入日报内容"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['attendance:daily:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['attendance:daily:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['attendance:daily:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['attendance:daily:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dailyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户名称" align="center" prop="nickName" width="100"/>
      <el-table-column label="日报时间" align="center" prop="dailyTime" width="200">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dailyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="周期" align="center" prop="weekCn" width="100"/>
      <el-table-column label="日报内容" align="left" prop="daily" width="800"/>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['attendance:daily:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['attendance:daily:remove']"
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

    <!-- 添加或修改日报管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="日报时间" prop="dailyTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.dailyTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择日报时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="日报内容" prop="daily">
          <el-input v-model="form.daily" type="textarea" placeholder="请输入日报内容" rows="11" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDaily, getDaily, delDaily, addDaily, updateDaily, exportDaily } from "@/api/attendance/daily";

export default {
  name: "Daily",
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
      // 日报管理表格数据
      dailyList: [],
      // 日期范围
      dateRange: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        nickName: null,
        dailyTime: null,
        daily: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        dailyTime: [
          { required: true, message: "日报时间不能为空", trigger: "blur" }
        ],
        daily: [
          { required: true, message: "日报内容不能为空", trigger: "blur" }
        ],
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
  },
  methods: {
    /** 查询日报管理列表 */
    getList() {
      this.loading = true;
      listDaily(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.dailyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        daily: null,
        remark: null
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
      //this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.dailyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加日报管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const dailyId = row.dailyId || this.ids
      getDaily(dailyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改日报管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.dailyId != null) {
            updateDaily(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDaily(this.form).then(response => {
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
      const dailyIds = row.dailyId || this.ids;
      this.$confirm('是否确认删除日报管理编号为"' + dailyIds + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return delDaily(dailyIds);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch((err) => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有日报管理数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return exportDaily(queryParams);
      }).then(response => {
        this.download(response.msg);
      }).catch((err) => {
      });
    },
    // 是我用来获取当月的第一天的
    handleTimeOld(time, split) {
      let date = new Date(time);
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      split = '-';
      return [year, month, 1].map(num => this.formatNumber(num)).join(split);
    },
    // handleTimeNew是获取今天的日期
    handleTimeNew(time) {
      let date = new Date(time);
      let year = date.getFullYear();
      let month = (date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
      let day = date.getDate() > 10 ? date.getDate() : ('0' + date.getDate());
      return `${year}-${month}-${day}`;
    },
    formatNumber(number) {
      return String(number)[1] ? String(number) : `0${number}`;
    }
  }
};
</script>
