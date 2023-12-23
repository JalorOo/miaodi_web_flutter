import '../data/page_backup.dart';
import '../model/passage_backup_model.dart';

class PassageBackupViewModel{
  PassageBackupModel _model = PassageBackupModel.getInstance();

  int _pageNum = 0;

  static List<PageBackUp> cloudPassagesList=[];
  static List<PageBackUp> trashPassagesList=[];
  Stream<List<PageBackUp>>? cloudPassageStream;

  PassageBackupViewModel._internal() {
    // 构造方法中初始化流相关的对象
    cloudPassageStream = _model.cloudPassagesController!.stream as Stream<List<PageBackUp>>;
  }

  static PassageBackupViewModel? _viewModel;

  static PassageBackupViewModel getInstance() {
    if (_viewModel == null) {
      _viewModel = PassageBackupViewModel._internal();
    }
    return _viewModel!;
  }

  /// [queryCloudPassages] 查询云服务中的文章
  /// 其中[refresh] 是指是否为刷新操作，若是刷新操作，则需要重新从第一页开始查询
  Future<void> queryHistoryPassages(int id, {bool refresh = false}) async {
    if (refresh) {
      _pageNum = 0;
    } else {
      _pageNum ++ ;
    }
    await _model.queryHistoryPassages(id,_pageNum);
  }

}