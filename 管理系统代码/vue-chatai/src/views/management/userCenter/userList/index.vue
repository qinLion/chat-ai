<template>
  <div class="user-list">
    <div class="search">
      <div class="select-search">
        <el-input
          class="input-phone"
          placeholder="请输入用户手机号"
          suffix-icon="el-icon-search"
          v-model="phone">
        </el-input>
        <el-select class="user-type" v-model="userType" placeholder="请选择用户类型">
          <el-option
            v-for="item in userTypeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
        <el-select v-model="vipType" placeholder="请选择订阅类型">
          <el-option
            v-for="item in submitTypeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </div>
      <div class="data">
        <el-date-picker
          v-model="dateTime"
          type="daterange"
          :picker-options="pickerOptions"
          range-separator="至"
          start-placeholder="注册日期（起）"
          end-placeholder="注册日期（止）"
          align="right"
        >
        </el-date-picker>
      </div>
      <el-button type="primary" @click="handleQueryClick">查询</el-button>
    </div>
    <div class="table">
      <el-table
        :data="tableData"
        style="width: 100%"
      >
        <el-table-column
          label="序号"
          type="index"
          width="50"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="id"
          label="用户ID"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="phone"
          label="手机号"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="nickname"
          label="昵称"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="sex"
          label="性别"
          align="center"
          :formatter="sexFormatter"
        >
        </el-table-column>
        <el-table-column
          prop="createTimeString"
          label="注册日期"
          align="center"
          width="200px"
        >
        </el-table-column>
        <el-table-column
          prop="userType"
          label="用户类型"
          align="center"
          :formatter="userTypeFormatter"
        >
        </el-table-column>
        <el-table-column
          prop="vipType"
          label="订阅类型"
          align="center"
          :formatter="vipTypeFormatter"
        >
        </el-table-column>
        <el-table-column
          prop="count"
          label="邀请用户数"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="isAvailable"
          label="操作"
          align="center"
        >
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.isAvailable"
              :active-value=0
              :inactive-value=1
              @change="handleStatusChange(scope.row)"
            ></el-switch>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="footer">
      <el-pagination
        background
        layout="total, sizes, prev, pager, next"
        :current-page="pageNum"
        :page-sizes="[10, 20, 30, 40]"
        :page-size="pageSize"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>
  </div>
</template>
<script>
import { userList,userUpdate } from "@/api/management";
import dayjs from 'dayjs'

export default {
  data() {
    return {
      userTypeOptions: [
        {
          value: 0,
          label: '全部'
        },
        {
          value: 1,
          label: '普通用户'
        },
        {
          value: 2,
          label: '订阅用户'
        }
      ],
      submitTypeOptions: [
        {
          value: 5,
          label: '7天'
        },
        {
          value: 4,
          label: '包月',
        },
        {
          value: 3,
          label: '包季',
        },
        {
          value: 2,
          label: '包年',
        },
        {
          value: 1,
          label: '永久',
        },
        {
          value: 0,
          label: '全部'
        }
      ],
      phone: '',
      userType: '',
      vipType: '',
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
      dateTime: '',
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
    }
  },
  created() {
    this.queryUserList()
  },
  methods: {
    async queryUserList() {
      const params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        startTime: (this.dateTime && this.dateTime.length>0) ? dayjs(this.dateTime[0]).format("YYYY-MM-DD") : "",
        endTime: (this.dateTime && this.dateTime.length>0) ? dayjs(this.dateTime[1]).format("YYYY-MM-DD") : "",
        phone: this.phone,
        userType: this.userType,
        vipType: this.vipType
      }
      const res = await userList(params)
      if (res.code === 200) {
        this.tableData = res.rows
        this.total = res.total
      }
    },
    handleQueryClick() {
      this.queryUserList()
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.queryUserList()
    },
    handleCurrentChange(val) {
      this.pageNum = val;
      this.queryUserList()
    },
    // 状态修改
    handleStatusChange(row) {
      let text = row.isAvailable == 0 ? "启用" : "禁用";
      this.$modal.confirm('确认要' + text + '"' + row.id + '"吗？').then(function() {
        const params = {
          id: row.id,
          isAvailable: row.isAvailable
        }
        return userUpdate(params);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.isAvailable = row.isAvailable === 1 ? 0 : 1;
      });
    },
    sexFormatter(row) {
      switch (row.sex) {
        case 0:
          return "男"
        case 1:
          return "女"
      }
    },
    userTypeFormatter(row) {
      switch (row.userType) {
        case 1:
          return "普通用户"
        case 2:
          return "订阅用户"
      }
    },
    vipTypeFormatter(row) {
      switch (row.vipType) {
        case 1:
          return "永久"
        case 2:
          return "包年"
        case 3:
          return "包季"
        case 4:
          return "包月"
        case 5:
          return "7天"
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.user-list {
  height: 100%;
  margin: 20px;

  .search {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    .select-search {
      display: flex;
      justify-content: space-between;
      align-items: center;
      .input-phone {
        width: 40%;
      }
      .user-type {
        margin: 0 10px;
      }
    }

    .data {
      margin: 0 10px;
    }
  }

  .table {
    margin: 20px 0;
  }
}
</style>
