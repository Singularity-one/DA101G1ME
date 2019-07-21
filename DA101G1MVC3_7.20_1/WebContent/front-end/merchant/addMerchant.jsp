<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.merchant.model.*"%>
<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO");
%>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>GuideMainPage</title>
    <style type="text/css">
    	body{
    		font-family: Microsoft JhengHei;

    	}

		.top{
			padding-top: 7.5%;
			color:#fff;
		}
		.info{
			padding-top: 20px;
			letter-spacing: 4px;
		}
    	.content{
    		margin-top: 5%;
    		height: 900px;
    		padding:80px;
			background-color: #fff;
    	}
		.right{
			margin-left:160px;
		}
    	#guide_pic{
    		height:300px;
    		width:300px;
    		border-radius: 50%;
    		border-color: #fff;
    		border: 3px solid;
    	}
    	.list-group-item{
    		color:#666;
    		padding-left: 20px;
    		letter-spacing: 2px;
    	}
		.title-2{
			line-height: 45px;
			font-family:monospace;
			font-size:18px;
			letter-spacing: 2px;
			font-weight:bold;
			color:dimgray;
			border-bottom: 1px solid #aaa;
		}
		.title{
			font-family:monospace;
			font-size:23px;
			letter-spacing: 2px;
			font-weight:bold;
			color:#666;
		}
		.lang{
			padding-top: 20px;
			padding-bottom: 20px;
			letter-spacing: 2px;
		}
		.outer{
			position: relative;
			z-index: 10;
			background-size:cover;
			background-color: #333;
		}
		#cover{
			position: fixed;
			width: 100%;
			height:auto;
			z-index: -10;
			filter: brightness(0.5);

		}
		a {
   			text-decoration: none !important;
		}
		
		#box12{
     		position: absolute;
     		left:  70%;      /* ������Z��*/
    		top:   5%;     /* ��m���� */
     		text-align: center;
     		font-size: 15px;
     		padding: 10px;
     		border: 1px solid 	#000000;  /*����C�� */
     		background-color: white;
    		box-shadow: 1px 1px 5px #333333;
    		width: 400px;      /* �Ӥ��j�p */
     		transform: rotate(15deg);  /* ���ਤ�� */
     		border-style:solud;  
	 		padding-bottom:50px;  /* �U����Z */
   	    }
   	    
    </style>
    
    <!-- ��J�a�} -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
(function ($) {
    var city_list = [
        { pinyin: 'taipeicity', name: '�x�_��' }, { pinyin: 'xinbeicity', name: '�s�_��' }, { pinyin: 'keelungcity', name: '�򶩥�' },
        { pinyin: 'taoyuancounty', name: '��鿤' }, { pinyin: 'hsinchucounty', name: '�s�˿�' }, { pinyin: 'hsinchucity', name: '�s�˥�' },
        { pinyin: 'miaolicounty', name: '�]�߿�' }, { pinyin: 'yilancounty', name: '�y����' }, { pinyin: 'taichungcity', name: '�x����' },
        { pinyin: 'changhuacounty', name: '���ƿ�' }, { pinyin: 'nantoucounty', name: '�n�뿤' }, { pinyin: 'yunlincounty', name: '���L��' },
        { pinyin: 'chiayicity', name: '�Ÿq��' }, { pinyin: 'chiayicounty', name: '�Ÿq��' }, { pinyin: 'tainancity', name: '�x�n��' },
        { pinyin: 'kaohsiungcity', name: '������' }, { pinyin: 'pingtungcounty', name: '�̪F��' }, { pinyin: 'hualiencounty', name: '�Ὤ��' },
        { pinyin: 'taitungcounty', name: '�x�F��' }, { pinyin: 'penghucounty', name: '���' }, { pinyin: 'kinmencounty', name: '������' },
        { pinyin: 'lienchiangcounty', name: '�s����' }
        ]
    var dist_list = [
        { city: 'keelungcity', pinyin: 'qidu', name: '�C����' },
        { city: 'penghucounty', pinyin: 'qimei', name: '�C���m' },
        { city: 'tainancity', pinyin: 'qigu', name: '�C�Ѱ�' },
        { city: 'pingtungcounty', pinyin: 'sandimen', name: '�T�a���m' },
        { city: 'xinbeicity', pinyin: 'sanxia', name: '�T�l��' },
        { city: 'yilancounty', pinyin: 'sanxing', name: '�T�P�m' },
        { city: 'kaohsiungcity', pinyin: 'sanmin', name: '�T����' },
        { city: 'miaolicounty', pinyin: 'sanwan', name: '�T�W�m' },
        { city: 'miaolicounty', pinyin: 'sanyi', name: '�T�q�m' },
        { city: 'xinbeicity', pinyin: 'sanzhi', name: '�T�۰�' },
        { city: 'xinbeicity', pinyin: 'sanchong', name: '�T����' },
        { city: 'tainancity', pinyin: 'xiaying', name: '�U���' },
        { city: 'taichungcity', pinyin: 'central', name: '����' },
        { city: 'xinbeicity', pinyin: 'zhonghe', name: '���M��' },
        { city: 'chiayicounty', pinyin: 'zhongpu', name: '���H�m' },
        { city: 'taoyuancounty', pinyin: 'zhongli', name: '���c��' },
        { city: 'nantoucounty', pinyin: 'zhongliao', name: '���d�m' },
        { city: 'keelungcity', pinyin: 'zhongshan', name: '���s��' },
        { city: 'taipeicity', pinyin: 'zhongshan', name: '���s��' },
        { city: 'keelungcity', pinyin: 'zhongzheng', name: '������' },
        { city: 'taipeicity', pinyin: 'zhongzheng', name: '������' },
        { city: 'tainancity', pinyin: 'westcentral', name: '�����' },
        { city: 'pingtungcounty', pinyin: 'jiuru', name: '�E�p�m' },
        { city: 'yunlincounty', pinyin: 'erlun', name: '�G�[�m' },
        { city: 'changhuacounty', pinyin: 'erlin', name: '�G�L��' },
        { city: 'changhuacounty', pinyin: 'ershui', name: '�G���m' },
        { city: 'hsinchucounty', pinyin: 'wufeng', name: '���p�m' },
        { city: 'yilancounty', pinyin: 'wujie', name: '�����m' },
        { city: 'xinbeicity', pinyin: 'wugu', name: '���Ѱ�' },
        { city: 'tainancity', pinyin: 'rende', name: '���w��' },
        { city: 'keelungcity', pinyin: 'renai', name: '���R��' },
        { city: 'nantoucounty', pinyin: 'renai', name: '���R�m' },
        { city: 'kaohsiungcity', pinyin: 'renwu', name: '���Z��' },
        { city: 'changhuacounty', pinyin: 'shengang', name: '����m' },
        { city: 'pingtungcounty', pinyin: 'jiadong', name: '�ΥV�m' },
        { city: 'tainancity', pinyin: 'jiali', name: '�Ψ���' },
        { city: 'pingtungcounty', pinyin: 'laiyi', name: '�Ӹq�m' },
        { city: 'keelungcity', pinyin: 'xinyi', name: '�H�q��' },
        { city: 'taipeicity', pinyin: 'xinyi', name: '�H�q��' },
        { city: 'nantoucounty', pinyin: 'xinyi', name: '�H�q�m' },
        { city: 'yunlincounty', pinyin: 'yuanchang', name: '�����m' },
        { city: 'hualiencounty', pinyin: 'guangfu', name: '���_�m' },
        { city: 'pingtungcounty', pinyin: 'neipu', name: '���H�m' },
        { city: 'taipeicity', pinyin: 'neihu', name: '�����' },
        { city: 'kaohsiungcity', pinyin: 'neimen', name: '������' },
        { city: 'taoyuancounty', pinyin: 'bade', name: '�K�w��' },
        { city: 'xinbeicity', pinyin: 'bali', name: '�K����' },
        { city: 'miaolicounty', pinyin: 'gongguan', name: '���]�m' },
        { city: 'tainancity', pinyin: 'liujia', name: '���Ұ�' },
        { city: 'chiayicounty', pinyin: 'liujiao', name: '���}�m' },
        { city: 'kaohsiungcity', pinyin: 'liugui', name: '���t��' },
        { city: 'yilancounty', pinyin: 'dongshan', name: '�V�s�m' },
        { city: 'kaohsiungcity', pinyin: 'qianjin', name: '�e����' },
        { city: 'kaohsiungcity', pinyin: 'qianzhen', name: '�e���' },
        { city: 'hsinchucity', pinyin: 'north', name: '�_��' },
        { city: 'taichungcity', pinyin: 'north', name: '�_��' },
        { city: 'tainancity', pinyin: 'north', name: '�_��' },
        { city: 'hsinchucounty', pinyin: 'beipu', name: '�_�H�m' },
        { city: 'taichungcity', pinyin: 'beitun', name: '�_�ٰ�' },
        { city: 'taipeicity', pinyin: 'beitou', name: '�_���' },
        { city: 'changhuacounty', pinyin: 'beidou', name: '�_����' },
        { city: 'yunlincounty', pinyin: 'beigang', name: '�_����' },
        { city: 'lienchiangcounty', pinyin: 'beigan', name: '�_��m' },
        { city: 'tainancity', pinyin: 'beimen', name: '�_����' },
        { city: 'taitungcounty', pinyin: 'beinan', name: '���n�m' },
        { city: 'hualiencounty', pinyin: 'zhuoxi', name: '���˶m' },
        { city: 'miaolicounty', pinyin: 'zhuolan', name: '������' },
        { city: 'tainancity', pinyin: 'nanhua', name: '�n�ư�' },
        { city: 'taichungcity', pinyin: 'south', name: '�n��' },
        { city: 'tainancity', pinyin: 'south', name: '�n��' },
        { city: 'taichungcity', pinyin: 'nantun', name: '�n�ٰ�' },
        { city: 'pingtungcounty', pinyin: 'nanzhou', name: '�n�{�m' },
        { city: 'miaolicounty', pinyin: 'nanzhuang', name: '�n�ܶm' },
        { city: 'nantoucounty', pinyin: 'nantou', name: '�n�륫' },
        { city: 'nanhaiislands', pinyin: 'nansha', name: '�n�F�s�q' },
        { city: 'taipeicity', pinyin: 'nangang', name: '�n���' },
        { city: 'yilancounty', pinyin: 'nanao', name: '�n�D�m' },
        { city: 'lienchiangcounty', pinyin: 'nangan', name: '�n��m' },
        { city: 'yunlincounty', pinyin: 'kouhu', name: '�f��m' },
        { city: 'yunlincounty', pinyin: 'gukeng', name: '�j�|�m' },
        { city: 'taitungcounty', pinyin: 'taitung', name: '�x�F��' },
        { city: 'yunlincounty', pinyin: 'taixi', name: '�x��m' },
        { city: 'hualiencounty', pinyin: 'jian', name: '�N�w�m' },
        { city: 'nantoucounty', pinyin: 'mingjian', name: '�W���m' },
        { city: 'taichungcity', pinyin: 'houli', name: '�Z����' },
        { city: 'taichungcity', pinyin: 'heping', name: '�M����' },
        { city: 'changhuacounty', pinyin: 'hemei', name: '�M����' },
        { city: 'yilancounty', pinyin: 'yuanshan', name: '���s�m' },
        { city: 'changhuacounty', pinyin: 'yuanlin', name: '���L��' },
        { city: 'tainancity', pinyin: 'shanhua', name: '���ư�' },
        { city: 'yunlincounty', pinyin: 'sihu', name: '�|��m' },
        { city: 'nantoucounty', pinyin: 'guoxing', name: '��m�m' },
        { city: 'xinbeicity', pinyin: 'tucheng', name: '�g����' },
        { city: 'yunlincounty', pinyin: 'tuku', name: '�g�w��' },
        { city: 'xinbeicity', pinyin: 'pinglin', name: '�W�L��' },
        { city: 'changhuacounty', pinyin: 'puxin', name: '�H�߶m' },
        { city: 'nantoucounty', pinyin: 'puli', name: '�H����' },
        { city: 'changhuacounty', pinyin: 'puyan', name: '�H�Q�m' },
        { city: 'changhuacounty', pinyin: 'pitou', name: '���Y�m' },
        { city: 'taipeicity', pinyin: 'shilin', name: '�h�L��' },
        { city: 'yilancounty', pinyin: 'zhuangwei', name: '����m' },
        { city: 'hualiencounty', pinyin: 'shoufeng', name: '���׶m' },
        { city: 'taichungcity', pinyin: 'waipu', name: '�~�H��' },
        { city: 'tainancity', pinyin: 'danei', name: '�j����' },
        { city: 'taipeicity', pinyin: 'datong', name: '�j�P��' },
        { city: 'yilancounty', pinyin: 'datong', name: '�j�P�m' },
        { city: 'taoyuancounty', pinyin: 'dayuan', name: '�j��m' },
        { city: 'changhuacounty', pinyin: 'dacheng', name: '�j���m' },
        { city: 'chiayicounty', pinyin: 'dapu', name: '�j�H�m' },
        { city: 'yunlincounty', pinyin: 'dapi', name: '�j��m' },
        { city: 'taichungcity', pinyin: 'daan', name: '�j�w��' },
        { city: 'taipeicity', pinyin: 'daan', name: '�j�w��' },
        { city: 'kaohsiungcity', pinyin: 'daliao', name: '�j�d��' },
        { city: 'changhuacounty', pinyin: 'dacun', name: '�j���m' },
        { city: 'chiayicounty', pinyin: 'dalin', name: '�j�L��' },
        { city: 'kaohsiungcity', pinyin: 'dashu', name: '�j���' },
        { city: 'taitungcounty', pinyin: 'dawu', name: '�j�Z�m' },
        { city: 'miaolicounty', pinyin: 'dahu', name: '�j��m' },
        { city: 'taoyuancounty', pinyin: 'daxi', name: '�j����' },
        { city: 'taichungcity', pinyin: 'dajia', name: '�j�Ұ�' },
        { city: 'kaohsiungcity', pinyin: 'dashe', name: '�j����' },
        { city: 'taichungcity', pinyin: 'dadu', name: '�j�{��' },
        { city: 'taichungcity', pinyin: 'dali', name: '�j����' },
        { city: 'taichungcity', pinyin: 'daya', name: '�j����' },
        { city: 'chiayicounty', pinyin: 'taibao', name: '�ӫO��' },
        { city: 'taichungcity', pinyin: 'taiping', name: '�ӥ���' },
        { city: 'taitungcounty', pinyin: 'taimali', name: '�ӳ¨��m' },
        { city: 'tainancity', pinyin: 'xuejia', name: '�ǥҰ�' },
        { city: 'tainancity', pinyin: 'annan', name: '�w�n��' },
        { city: 'tainancity', pinyin: 'anding', name: '�w�w��' },
        { city: 'tainancity', pinyin: 'anping', name: '�w����' },
        { city: 'keelungcity', pinyin: 'anle', name: '�w�ְ�' },
        { city: 'tainancity', pinyin: 'guantian', name: '�x�а�' },
        { city: 'yilancounty', pinyin: 'yilan', name: '�y����' },
        { city: 'hualiencounty', pinyin: 'fuli', name: '�I���m' },
        { city: 'hsinchucounty', pinyin: 'baoshan', name: '�_�s�m' },
        { city: 'tainancity', pinyin: 'jiangjun', name: '�N�x��' },
        { city: 'kaohsiungcity', pinyin: 'xiaogang', name: '�p���' },
        { city: 'hsinchucounty', pinyin: 'jianshi', name: '�y�۶m' },
        { city: 'pingtungcounty', pinyin: 'pingtung', name: '�̪F��' },
        { city: 'tainancity', pinyin: 'shanshang', name: '�s�W��' },
        { city: 'kaohsiungcity', pinyin: 'gangshan', name: '���s��' },
        { city: 'hsinchucounty', pinyin: 'emei', name: '�o�ܶm' },
        { city: 'pingtungcounty', pinyin: 'kanding', name: '�r���m' },
        { city: 'yunlincounty', pinyin: 'lunbei', name: '�[�I�m' },
        { city: 'kaohsiungcity', pinyin: 'zuoying', name: '�����' },
        { city: 'tainancity', pinyin: 'zuozhen', name: '�����' },
        { city: 'chiayicounty', pinyin: 'budai', name: '���U��' },
        { city: 'xinbeicity', pinyin: 'pingxi', name: '���˰�' },
        { city: 'taoyuancounty', pinyin: 'pingzhen', name: '����' },
        { city: 'taitungcounty', pinyin: 'yanping', name: '�����m' },
        { city: 'kaohsiungcity', pinyin: 'mituo', name: '������' },
        { city: 'changhuacounty', pinyin: 'changhua', name: '���ƥ�' },
        { city: 'tainancity', pinyin: 'houbi', name: '�����' },
        { city: 'miaolicounty', pinyin: 'houlong', name: '���s��' },
        { city: 'taoyuancounty', pinyin: 'fuxing', name: '�_���m' },
        { city: 'pingtungcounty', pinyin: 'hengchun', name: '��K��' },
        { city: 'taitungcounty', pinyin: 'chenggong', name: '���\��' },
        { city: 'taipeicity', pinyin: 'wenshan', name: '��s��' },
        { city: 'yunlincounty', pinyin: 'douliu', name: '�椻��' },
        { city: 'yunlincounty', pinyin: 'dounan', name: '��n��' },
        { city: 'tainancity', pinyin: 'xinhua', name: '�s�ư�' },
        { city: 'pingtungcounty', pinyin: 'xinyuan', name: '�s��m' },
        { city: 'hualiencounty', pinyin: 'xincheng', name: '�s���m' },
        { city: 'hsinchucounty', pinyin: 'xinpu', name: '�s�H��' },
        { city: 'pingtungcounty', pinyin: 'xinpi', name: '�s��m' },
        { city: 'taoyuancounty', pinyin: 'xinwu', name: '�s�ζm' },
        { city: 'tainancity', pinyin: 'xinshi', name: '�s����' },
        { city: 'xinbeicity', pinyin: 'xindian', name: '�s����' },
        { city: 'chiayicounty', pinyin: 'xingang', name: '�s��m' },
        { city: 'tainancity', pinyin: 'xinying', name: '�s���' },
        { city: 'taichungcity', pinyin: 'xinshe', name: '�s����' },
        { city: 'kaohsiungcity', pinyin: 'xinxing', name: '�s����' },
        { city: 'xinbeicity', pinyin: 'xinzhuang', name: '�s����' },
        { city: 'hsinchucounty', pinyin: 'xinfeng', name: '�s�׶m' },
        { city: 'kaohsiungcity', pinyin: 'qishan', name: '�X�s��' },
        { city: 'kaohsiungcity', pinyin: 'qijin', name: '�X�z��' },
        { city: 'pingtungcounty', pinyin: 'chunri', name: '�K��m' },
        { city: 'keelungcity', pinyin: 'nuannuan', name: '�x�x��' },
        { city: 'penghucounty', pinyin: 'wangan', name: '��w�m' },
        { city: 'chiayicounty', pinyin: 'puzi', name: '���l��' },
        { city: 'kaohsiungcity', pinyin: 'shanlin', name: '���L��' },
        { city: 'taichungcity', pinyin: 'dongshi', name: '�F�հ�' },
        { city: 'yunlincounty', pinyin: 'dongshi', name: '�F�նm' },
        { city: 'chiayicity', pinyin: 'east', name: '�F��' },
        { city: 'hsinchucity', pinyin: 'east', name: '�F��' },
        { city: 'taichungcity', pinyin: 'east', name: '�F��' },
        { city: 'tainancity', pinyin: 'east', name: '�F��' },
        { city: 'tainancity', pinyin: 'dongshan', name: '�F�s��' },
        { city: 'lienchiangcounty', pinyin: 'dongyin', name: '�F�޶m' },
        { city: 'nanhaiislands', pinyin: 'dongsha', name: '�F�F�s�q' },
        { city: 'taitungcounty', pinyin: 'donghe', name: '�F�e�m' },
        { city: 'pingtungcounty', pinyin: 'donggang', name: '�F����' },
        { city: 'chiayicounty', pinyin: 'dongshi', name: '�F�۶m' },
        { city: 'taipeicity', pinyin: 'songshan', name: '�Q�s��' },
        { city: 'xinbeicity', pinyin: 'banqiao', name: '�O����' },
        { city: 'pingtungcounty', pinyin: 'fangliao', name: '�D�d�m' },
        { city: 'pingtungcounty', pinyin: 'fangshan', name: '�D�s�m' },
        { city: 'yunlincounty', pinyin: 'linnei', name: '�L���m' },
        { city: 'xinbeicity', pinyin: 'linkou', name: '�L�f��' },
        { city: 'kaohsiungcity', pinyin: 'linyuan', name: '�L���' },
        { city: 'pingtungcounty', pinyin: 'linbian', name: '�L��m' },
        { city: 'tainancity', pinyin: 'liuying', name: '�h���' },
        { city: 'taoyuancounty', pinyin: 'taoyuan', name: '��饫' },
        { city: 'kaohsiungcity', pinyin: 'taoyuan', name: '�緽��' },
        { city: 'chiayicounty', pinyin: 'meishan', name: '���s�m' },
        { city: 'kaohsiungcity', pinyin: 'ziguan', name: '��x��' },
        { city: 'taichungcity', pinyin: 'wuqi', name: '��ϰ�' },
        { city: 'taoyuancounty', pinyin: 'yangmei', name: '������' },
        { city: 'kaohsiungcity', pinyin: 'nanzi', name: '�����' },
        { city: 'tainancity', pinyin: 'nanxi', name: '�����' },
        { city: 'xinbeicity', pinyin: 'shulin', name: '��L��' },
        { city: 'kaohsiungcity', pinyin: 'qiaotou', name: '���Y��' },
        { city: 'hsinchucounty', pinyin: 'hengshan', name: '��s�m' },
        { city: 'tainancity', pinyin: 'guiren', name: '�k����' },
        { city: 'chiayicounty', pinyin: 'minxiong', name: '�����m' },
        { city: 'chiayicounty', pinyin: 'shuishang', name: '���W�m' },
        { city: 'yunlincounty', pinyin: 'shuilin', name: '���L�m' },
        { city: 'nantoucounty', pinyin: 'shuili', name: '�����m' },
        { city: 'xinbeicity', pinyin: 'yonghe', name: '�éM��' },
        { city: 'kaohsiungcity', pinyin: 'yongan', name: '�æw��' },
        { city: 'tainancity', pinyin: 'yongkang', name: '�ñd��' },
        { city: 'changhuacounty', pinyin: 'yongjing', name: '�ùt�m' },
        { city: 'xinbeicity', pinyin: 'xizhi', name: '�����' },
        { city: 'taitungcounty', pinyin: 'chishang', name: '���W�m' },
        { city: 'taichungcity', pinyin: 'shalu', name: '�F����' },
        { city: 'miaolicounty', pinyin: 'taian', name: '���w�m' },
        { city: 'xinbeicity', pinyin: 'taishan', name: '���s��' },
        { city: 'pingtungcounty', pinyin: 'taiwu', name: '���Z�m' },
        { city: 'taitungcounty', pinyin: 'haiduan', name: '���ݶm' },
        { city: 'xinbeicity', pinyin: 'danshui', name: '�H����' },
        { city: 'xinbeicity', pinyin: 'shenkeng', name: '�`�|��' },
        { city: 'taichungcity', pinyin: 'qingshui', name: '�M����' },
        { city: 'kaohsiungcity', pinyin: 'hunei', name: '�򤺰�' },
        { city: 'hsinchucounty', pinyin: 'hukou', name: '��f�m' },
        { city: 'penghucounty', pinyin: 'huxi', name: '���m' },
        { city: 'chiayicounty', pinyin: 'xikou', name: '�ˤf�m' },
        { city: 'changhuacounty', pinyin: 'xizhou', name: '�˦{�m' },
        { city: 'changhuacounty', pinyin: 'xihu', name: '�˴���' },
        { city: 'pingtungcounty', pinyin: 'manzhou', name: '���{�m' },
        { city: 'taichungcity', pinyin: 'tanzi', name: '��l��' },
        { city: 'pingtungcounty', pinyin: 'chaozhou', name: '��{��' },
        { city: 'kinmencounty', pinyin: 'lieyu', name: '�P���m' },
        { city: 'xinbeicity', pinyin: 'wulai', name: '�Q�Ӱ�' },
        { city: 'kinmencounty', pinyin: 'wuqiu', name: '�Q���m' },
        { city: 'taichungcity', pinyin: 'wuri', name: '�Q���' },
        { city: 'kaohsiungcity', pinyin: 'yanchao', name: '�P�_��' },
        { city: 'pingtungcounty', pinyin: 'mudan', name: '�d���m' },
        { city: 'pingtungcounty', pinyin: 'shizi', name: '��l�m' },
        { city: 'miaolicounty', pinyin: 'shitan', name: '���m' },
        { city: 'tainancity', pinyin: 'yujing', name: '�ɤ���' },
        { city: 'hualiencounty', pinyin: 'yuli', name: '�ɨ���' },
        { city: 'pingtungcounty', pinyin: 'liuqiu', name: '�[�y�m' },
        { city: 'hualiencounty', pinyin: 'ruisui', name: '���J�m' },
        { city: 'xinbeicity', pinyin: 'ruifang', name: '��ڰ�' },
        { city: 'pingtungcounty', pinyin: 'majia', name: '���a�m' },
        { city: 'changhuacounty', pinyin: 'tianzhong', name: '�Ф���' },
        { city: 'kaohsiungcity', pinyin: 'tianliao', name: '�мd��' },
        { city: 'changhuacounty', pinyin: 'tianwei', name: '�Ч��m' },
        { city: 'kaohsiungcity', pinyin: 'jiaxian', name: '�ҥP��' },
        { city: 'chiayicounty', pinyin: 'fanlu', name: '�f���m' },
        { city: 'penghucounty', pinyin: 'baisha', name: '�ըF�m' },
        { city: 'tainancity', pinyin: 'baihe', name: '�ժe��' },
        { city: 'taichungcity', pinyin: 'shigang', name: '�۩���' },
        { city: 'xinbeicity', pinyin: 'shiding', name: '�����' },
        { city: 'xinbeicity', pinyin: 'shimen', name: '�۪���' },
        { city: 'yilancounty', pinyin: 'jiaoxi', name: '�G�˶m' },
        { city: 'changhuacounty', pinyin: 'shetou', name: '���Y�m' },
        { city: 'taichungcity', pinyin: 'shengang', name: '������' },
        { city: 'changhuacounty', pinyin: 'fuxing', name: '�ֿ��m' },
        { city: 'hualiencounty', pinyin: 'xiulin', name: '�q�L�m' },
        { city: 'changhuacounty', pinyin: 'xiushui', name: '�q���m' },
        { city: 'hsinchucounty', pinyin: 'zhubei', name: '�˥_��' },
        { city: 'miaolicounty', pinyin: 'zhunan', name: '�˫n��' },
        { city: 'changhuacounty', pinyin: 'zhutang', name: '�˶�m' },
        { city: 'nantoucounty', pinyin: 'zhushan', name: '�ˤs��' },
        { city: 'chiayicounty', pinyin: 'zhuqi', name: '�˱T�m' },
        { city: 'hsinchucounty', pinyin: 'zhudong', name: '�˪F��' },
        { city: 'pingtungcounty', pinyin: 'zhutian', name: '�˥жm' },
        { city: 'taitungcounty', pinyin: 'ludao', name: '��q�m' },
        { city: 'changhuacounty', pinyin: 'xianxi', name: '�u��m' },
        { city: 'yilancounty', pinyin: 'luodong', name: 'ù�F��' },
        { city: 'kaohsiungcity', pinyin: 'meinong', name: '���@��' },
        { city: 'chiayicounty', pinyin: 'yizhu', name: '�q�˶m' },
        { city: 'hsinchucounty', pinyin: 'qionglin', name: '�|�L�m' },
        { city: 'changhuacounty', pinyin: 'fenyuan', name: '���m' },
        { city: 'changhuacounty', pinyin: 'huatan', name: '��¶m' },
        { city: 'hualiencounty', pinyin: 'hualien', name: '�Ὤ��' },
        { city: 'changhuacounty', pinyin: 'fangyuan', name: '�ڭb�m' },
        { city: 'miaolicounty', pinyin: 'yuanli', name: '�b����' },
        { city: 'kaohsiungcity', pinyin: 'lingya', name: '�d����' },
        { city: 'miaolicounty', pinyin: 'miaoli', name: '�]�ߥ�' },
        { city: 'kaohsiungcity', pinyin: 'maolin', name: '�Z�L��' },
        { city: 'kaohsiungcity', pinyin: 'qieding', name: '�X�_��' },
        { city: 'nantoucounty', pinyin: 'caotun', name: '�����' },
        { city: 'lienchiangcounty', pinyin: 'juguang', name: '�����m' },
        { city: 'yunlincounty', pinyin: 'citong', name: '�l��m' },
        { city: 'pingtungcounty', pinyin: 'wandan', name: '�U���m' },
        { city: 'pingtungcounty', pinyin: 'wanluan', name: '�U�r�m' },
        { city: 'hualiencounty', pinyin: 'wanrong', name: '�U�a�m' },
        { city: 'taipeicity', pinyin: 'wanhua', name: '�U�ذ�' },
        { city: 'xinbeicity', pinyin: 'wanli', name: '�U����' },
        { city: 'xinbeicity', pinyin: 'luzhou', name: 'Ī�w��' },
        { city: 'taoyuancounty', pinyin: 'luzhu', name: 'Ī�˶m' },
        { city: 'yilancounty', pinyin: 'suao', name: 'Ĭ�D��' },
        { city: 'taitungcounty', pinyin: 'lanyu', name: '�����m' },
        { city: 'yunlincounty', pinyin: 'huwei', name: '�����' },
        { city: 'yunlincounty', pinyin: 'baozhong', name: '�ǩ��m' },
        { city: 'chiayicity', pinyin: 'west', name: '���' },
        { city: 'taichungcity', pinyin: 'west', name: '���' },
        { city: 'taichungcity', pinyin: 'xitun', name: '��ٰ�' },
        { city: 'penghucounty', pinyin: 'xiyu', name: '�����m' },
        { city: 'tainancity', pinyin: 'xigang', name: '����' },
        { city: 'miaolicounty', pinyin: 'xihu', name: '���m' },
        { city: 'yunlincounty', pinyin: 'xiluo', name: '������' },
        { city: 'taoyuancounty', pinyin: 'guanyin', name: '�[���m' },
        { city: 'taichungcity', pinyin: 'fengyuan', name: '�׭��' },
        { city: 'hualiencounty', pinyin: 'fengbin', name: '���ضm' },
        { city: 'xinbeicity', pinyin: 'gongliao', name: '�^�d��' },
        { city: 'kaohsiungcity', pinyin: 'luzhu', name: '���˰�' },
        { city: 'pingtungcounty', pinyin: 'checheng', name: '�����m' },
        { city: 'miaolicounty', pinyin: 'tongxiao', name: '�q�]��' },
        { city: 'miaolicounty', pinyin: 'zaoqiao', name: '�y���m' },
        { city: 'taitungcounty', pinyin: 'daren', name: '�F���m' },
        { city: 'kaohsiungcity', pinyin: 'namaxia', name: '�����L��' },
        { city: 'pingtungcounty', pinyin: 'ligang', name: '����m' },
        { city: 'kinmencounty', pinyin: 'jincheng', name: '������' },
        { city: 'kinmencounty', pinyin: 'jinning', name: '����m' },
        { city: 'xinbeicity', pinyin: 'jinshan', name: '���s��' },
        { city: 'taitungcounty', pinyin: 'jinfeng', name: '���p�m' },
        { city: 'kinmencounty', pinyin: 'jinsha', name: '���F��' },
        { city: 'kinmencounty', pinyin: 'jinhu', name: '������' },
        { city: 'miaolicounty', pinyin: 'tongluo', name: '���r�m' },
        { city: 'pingtungcounty', pinyin: 'changzhi', name: '���v�m' },
        { city: 'taitungcounty', pinyin: 'changbin', name: '���ضm' },
        { city: 'taitungcounty', pinyin: 'guanshan', name: '���s��' },
        { city: 'tainancity', pinyin: 'guanmiao', name: '���q��' },
        { city: 'hsinchucounty', pinyin: 'guanxi', name: '������' },
        { city: 'kaohsiungcity', pinyin: 'alian', name: '������' },
        { city: 'chiayicounty', pinyin: 'alishan', name: '�����s�m' },
        { city: 'nantoucounty', pinyin: 'jiji', name: '������' },
        { city: 'xinbeicity', pinyin: 'shuangxi', name: '���˰�' },
        { city: 'pingtungcounty', pinyin: 'wutai', name: '���x�m' },
        { city: 'taichungcity', pinyin: 'wufeng', name: '���p��' },
        { city: 'miaolicounty', pinyin: 'toufen', name: '�Y����' },
        { city: 'yilancounty', pinyin: 'toucheng', name: '�Y����' },
        { city: 'miaolicounty', pinyin: 'touwu', name: '�Y�ζm' },
        { city: 'hsinchucity', pinyin: 'xiangshan', name: '���s��' },
        { city: 'penghucounty', pinyin: 'magong', name: '������' },
        { city: 'pingtungcounty', pinyin: 'gaoshu', name: '����m' },
        { city: 'nantoucounty', pinyin: 'yuchi', name: '�����m' },
        { city: 'kaohsiungcity', pinyin: 'niaosong', name: '���Q��' },
        { city: 'kaohsiungcity', pinyin: 'fengshan', name: '��s��' },
        { city: 'hualiencounty', pinyin: 'fenglin', name: '��L��' },
        { city: 'xinbeicity', pinyin: 'yingge', name: '�a�q��' },
        { city: 'pingtungcounty', pinyin: 'yanpu', name: '�Q�H�m' },
        { city: 'kaohsiungcity', pinyin: 'yancheng', name: '�Q�L��' },
        { city: 'tainancity', pinyin: 'yanshui', name: '�Q����' },
        { city: 'changhuacounty', pinyin: 'lugang', name: '������' },
        { city: 'chiayicounty', pinyin: 'lucao', name: '����m' },
        { city: 'nantoucounty', pinyin: 'lugu', name: '�����m' },
        { city: 'taitungcounty', pinyin: 'luye', name: '�����m' },
        { city: 'pingtungcounty', pinyin: 'linluo', name: '�ﬥ�m' },
        { city: 'yunlincounty', pinyin: 'mailiao', name: '���d�m' },
        { city: 'tainancity', pinyin: 'madou', name: '�¨���' },
        { city: 'kaohsiungcity', pinyin: 'gushan', name: '���s��' },
        { city: 'taichungcity', pinyin: 'longjing', name: '�s����' },
        { city: 'tainancity', pinyin: 'longqi', name: '�s�T��' },
        { city: 'taoyuancounty', pinyin: 'longtan', name: '�s��m' },
        { city: 'taoyuancounty', pinyin: 'guishan', name: '�t�s�m' }
        ];

    $.fn.twaddress = function () {
        this.each(function () {
            function info() {
                this.city = '';
                this.city_pinyin = '';
                this.dist = '';
                this.dist_pinyin = '';
                this.detail = '';
            }
            var o = new info();
            var old_dist = null;
            var opts = $.extend({}, $.fn.twaddress.defaults);
            var options = { city: "", dist: "", detail: "" };
            var fisttimeflag = true;
            var $inputbox = $(this);
            var $twaddrs = $('<div style="display: inline;"></div>');
            var $twcity = $('<select></select>');
            var $twmore = $('<input type="text" class="input"></input>');
            for (var i = 0; i < city_list.length; i++) {
                if ($inputbox.val().indexOf(city_list[i].name) >= 0) {
                    options.city = city_list[i].name;
                    $inputbox.val($inputbox.val().replace(city_list[i].name, ""));
                }
            }
            var mx_len = 0;
            for (var i = 0; i < dist_list.length; i++) {
                if ($inputbox.val().indexOf(dist_list[i].name) >= 0) {
                    if (mx_len < dist_list[i].name.length) {
                        mx_len = dist_list[i].name.length;
                        options.dist = dist_list[i].name;
                    }
                }
            }
            $inputbox.val($inputbox.val().replace(options.dist, ""));
            options.detail = $inputbox.val();
            $twcity.keyup(function () {
                $twcity.change();
            });
            $twcity.change(function () {
                var $new_twdist = $('<select></select>');
                if (options != undefined && options.detail != undefined && fisttimeflag) {
                    if (options.detail != "hidden") {
                        $twmore.val(options.detail);
                    } else {
                        $twmore.hide();
                    }
                }
                for (var i = 0; i < dist_list.length; i++) {
                    if (dist_list[i].city == $twcity.val()) {
                        if (options != undefined && options.dist != undefined && fisttimeflag && dist_list[i].name == options.dist) {
                            $new_twdist.append('<option value="' + dist_list[i].pinyin + '" selected="selected">' + dist_list[i].name + '</option>');
                            fisttimeflag = false;
                        } else {
                            $new_twdist.append('<option value="' + dist_list[i].pinyin + '">' + dist_list[i].name + '</option>');
                        }
                    }
                }
                $twcity.after($new_twdist);
                $inputbox.val(getValue($twcity, $new_twdist, $twmore, o));
                $inputbox.change();

                $new_twdist.keyup(function () {
                    $new_twdist.change();
                });
                $new_twdist.change(function () {
                    $inputbox.val(getValue($twcity, $new_twdist, $twmore, o));
                    $inputbox.change();
                });
                $twmore.change(function () {
                    $inputbox.val(getValue($twcity, $new_twdist, $twmore, o));
                    $inputbox.change();
                });
                if (old_dist != null) {
                    old_dist.hide().remove();
                }
                old_dist = $new_twdist;
            });

            for (var i = 0; i < city_list.length; i++) {
                if (options != undefined && options.city != undefined && city_list[i].name == options.city) {
                    $twcity.append('<option value="' + city_list[i].pinyin + '" selected="selected">' + city_list[i].name + '</option>');
                } else {
                    $twcity.append('<option value="' + city_list[i].pinyin + '">' + city_list[i].name + '</option>');
                }
            }
            $twaddrs.append($twcity);
            $twaddrs.append($twmore);
            $(this).after($twaddrs);
            $(this).hide();
            $twcity.change();
            return o;
        });
        function getValue(city, dist, more, o) {
            var full_address = '';
            for (var i = 0; i < city_list.length; i++) {
                if (city_list[i].pinyin == city.val()) {
                    full_address = city_list[i].name;
                    o.city = city_list[i].name;
                }
            }
            for (var i = 0; i < dist_list.length; i++) {
                if (dist_list[i].city == city.val() && dist_list[i].pinyin == dist.val()) {
                    full_address += dist_list[i].name;
                    o.dist = dist_list[i].name;
                }
            }
            o.city_pinyin = city.val();
            o.dist_pinyin = dist.val();
            o.detail = more.val();
            return full_address + more.val();
        }
    };

})(jQuery);

$(function () {
    $(".twaddress").twaddress();
});
</script>
    
    
  </head>
  <body>
<div class="outer">
<div class="outer">
	<img src="<%=request.getContextPath()%>/front-end/merchant/images/test1.jpg" id="cover">
	<div class="container">
		<div class="row justify-content-center top">
			<div>
			</div>
			<div>
			</div>
		</div>
	</div>

<div class="row justify-content-center content">
			<div class="col-2">
	</div>
<div class="col-5 right">
<p class="title">�ӽмt��</p>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />

    <div>
    <a href="<%=request.getContextPath()%>/MerchantServlet1?action=get_One_Merchant">&#10001;</a>
	</div>
	
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�t�ӷ|���b��:</td>
		<td><input type="TEXT" name="merchant_id" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_id()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӱK�X:</td>
		<td><input type="TEXT" name="merchant_pass" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_pass()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӰӮa�W��:</td>
		<td><input type="TEXT" name="merchant_name" size="45" 
			 value="<%= (merchantVO==null)? "��쪺�a" : merchantVO.getMerchant_name()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӭt�d�H�m�W:</td>
		<td><input type="TEXT" name="merchant_pm" size="45" 
			 value="<%= (merchantVO==null)? "�L���" : merchantVO.getMerchant_pm()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�Ӧa�}:</td>
<!-- 		<td><input type="TEXT" name="merchant_add" size="45"  -->
<%-- 			 value="<%= (merchantVO==null)? "��饫���c�Ϥ��j��300��" : merchantVO.getMerchant_add()%>" /></td> --%>
		<td><input name="merchant_add"  id="address" value="�x�����j�Ұ�" class="twaddress" /></td> 
	</tr>
	
	<tr>
		<td>�t�ӹq��:</td>
		<td><input type="TEXT" name="merchant_tel" size="45" 
			 value="<%= (merchantVO==null)? "(03)4226062" : merchantVO.getMerchant_tel()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӹq�l�l��:</td>
		<td><input type="TEXT" name="merchant_email" size="45" 
			 value="<%= (merchantVO==null)? "ncucc@cc.ncu.edu.tw" : merchantVO.getMerchant_email()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�Ӫ��A:</td>
		<td><%="���f��" %></td>
	</tr>
	
	<tr>
		<td>�t�ӻ���:</td>
<!-- 		<td><input type="TEXT" name="merchant_ps" size="45"  -->
<%-- 			 value="<%= (merchantVO==null)? "1915�~�Хߦܤ��A���g100�h�~���ѯСA�����j�Ǥw�����ꤺ�ּƾ��v�y�[�B�մ��u���B���A�u�}�����y�j�ǡC�ثe�ǥͤH�Ƭ�1�U2000�H�A���|�X�\�h�u�q�դ͡A����a�^�m�}�h�C" : merchantVO.getMerchant_ps()%>" /></td> --%>
	<td><textarea  name="merchant_ps" style="width:400px;height:120px;"></textarea></td>
	</tr>
	
	<tr>
		<td>�t�ӹϤ�:</td>
		<td>
		<input type="file" name="merchant_img" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png">
	    </td>
	</tr>
	
	
	
</table><br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="merchant_status" value="A1">
<input type="submit" value="�e�X�s�W"></FORM>
</div>

	<div id="box12">
<%--<img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;"> --%>
 	<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;" />
    </div>
    

	
<script>
function readURL(input){

		if(input.files && input.files[0]){

	var imageTagID = input.getAttribute("targetID");
	var reader = new FileReader();
		reader.onload = function (e) {
				var img = document.getElementById(imageTagID);
				img.setAttribute("src", e.target.result)
			 }
		 reader.readAsDataURL(input.files[0]);
		}
}
</script>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
  </body>
</html>